require 'rails_helper'

RSpec.describe Scrapings::Wakatime do
  describe '#pull_activities' do
    let(:student) { create(:student, enrollment_date: enrollment_date, wakatime_link: "https://wakatime.com/@marcodotcastro") }
    let(:final_enrollment_date) { nil }

    subject { described_class.new(resource: student, final_enrollment_date: final_enrollment_date) }

    describe 'total_activity' do
      let(:enrollment_date) { Date.new(2023, 1, 16) }

      it 'calculates total activity for the year 2023' do
        subject.pull_activities

        expect(student.practices.sum(:activity_total)).to eq(294369)
        expect(student.wakatime_activity_total).to eq(294369)
      end
    end

    describe 'average_activity' do
      let(:enrollment_date) { Date.new(2023, 2, 1) }

      context 'when the final enrollment date is April 30, 2023' do
        let(:final_enrollment_date) { Date.new(2023, 4, 30) }

        it 'calculates the average activity' do
          subject.pull_activities

          expect(student.wakatime_activity_average).to eq(638)
        end
      end

      context 'when the final enrollment date is May 31, 2023' do
        let(:final_enrollment_date) { Date.new(2023, 5, 31) }

        it 'calculates the average activity' do
          subject.pull_activities

          expect(student.wakatime_activity_average).to eq(492)
        end
      end
    end
  end

  describe '#convert_activity_to_seconds' do
    subject { described_class.new }

    it 'converts seconds correctly' do
      expect(subject.send(:convert_activity_to_seconds, "3s")).to eq(3)
    end

    it 'converts minutes correctly' do
      expect(subject.send(:convert_activity_to_seconds, "3m")).to eq(180)
    end

    it 'converts hours and minutes correctly' do
      expect(subject.send(:convert_activity_to_seconds, "3h 33m")).to eq(12780)
    end
  end
end
