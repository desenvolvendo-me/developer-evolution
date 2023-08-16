require 'rails_helper'

def create_practices_for_days(num_days, commit_total)
  (0..num_days - 1).each do |days_ago|
    commit_date = Date.today - (num_days - days_ago)
    create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
  end
end

RSpec.describe Ballasts::Discipline do
  let(:student) { create(:student) }

  describe '.call' do
    subject(:discipline) { described_class.call(resource: student) }

    context 'chart' do
      it 'discipline chart' do
        create_practices_for_days(90, 3)
        expect(discipline[:chart][:datasets][0][:data]).to eq([42, 42, 42, 42, 42, 42])
      end
    end

    context 'stats' do
      context "compared" do
        it 'micro_goal' do
          create_practices_for_days(14, 3)
          create_practices_for_days(14, 4)
          expect(discipline[:stats][:micro_goal_compared]).to eq(33.33)
        end
      end

      describe 'day' do
        context 'when last day is ok' do
          before { create_practices_for_days(1, 3) }

          it 'returns the last day stats' do
            expect(discipline[:stats][:day][:number]).to eq(3)
            expect(discipline[:stats][:day][:icon]).to eq('heart')
          end
        end

        context 'when last day is not ok' do
          before { create_practices_for_days(1, 2) }

          it 'returns the last day stats' do
            expect(discipline[:stats][:day][:number]).to eq(2)
            expect(discipline[:stats][:day][:icon]).to eq('heart-broken')
          end
        end
      end

      describe 'week' do
        it 'last week heart' do
          create_practices_for_days(14, 3)
          expect(discipline[:stats][:week][:number]).to eq(21)
          expect(discipline[:stats][:week][:icon]).to eq("heart")
        end

        it 'last week heart-broken' do
          create_practices_for_days(14, 2)
          expect(discipline[:stats][:week][:number]).to eq(14)
          expect(discipline[:stats][:week][:icon]).to eq("heart-broken")
        end
      end

      describe 'micro_goal' do
        before { create_practices_for_days(21, 2) }

        it 'calculates the sum for the last 2 weeks' do
          expect(discipline[:stats][:micro_goal][:number]).to eq(28)
          expect(discipline[:stats][:micro_goal][:icon]).to eq('heart-broken')
        end
      end

      describe 'goal' do
        before { create_practices_for_days(101, 5) }

        it 'returns the commits from the last 3 months' do
          expect(discipline[:stats][:goal][:number]).to eq(450)
          expect(discipline[:stats][:goal][:icon]).to eq('heart')
        end
      end

      describe 'time_available' do
        context 'change' do
          it 'today from 6 to 2' do
            student = create(:student, time_available: 6)
            practice = create(:practice, commit_date: Date.today, commit_total: 3, student: student)
            described_class.call(resource: student)

            expect(practice.time_available).to eq(6)
            expect(practice.commit_status).to eq("failure")
          end
        end
      end

      context 'student time available 4 hours' do
        before { Student.destroy_all }
        let(:student) { create(:student, time_available: 4) }
        subject(:discipline) { described_class.call(resource: student) }

        describe 'day' do
          context 'when last day is ok' do
            before { create_practices_for_days(1, 6) }

            it 'returns the last day stats' do
              expect(discipline[:stats][:day][:number]).to eq(6)
              expect(discipline[:stats][:day][:icon]).to eq('heart')
            end
          end

          context 'when last day is not ok' do
            before { create_practices_for_days(1, 5) }

            it 'returns the last day stats' do
              expect(discipline[:stats][:day][:number]).to eq(5)
              expect(discipline[:stats][:day][:icon]).to eq('heart-broken')
            end
          end
        end

        describe 'week' do
          before { create_practices_for_days(14, 7) }

          it 'calculates the correct sum for the last week' do
            expect(discipline[:stats][:week][:number]).to eq(49)
            expect(discipline[:stats][:week][:icon]).to eq('heart')
          end
        end

        describe 'micro_goal' do
          before { create_practices_for_days(21, 7) }

          it 'calculates the sum for the last 2 weeks' do
            expect(discipline[:stats][:micro_goal][:number]).to eq(98)
            expect(discipline[:stats][:micro_goal][:icon]).to eq('heart')
          end
        end

        describe 'goal' do
          before { create_practices_for_days(101, 5) }

          it 'returns the commits from the last 3 months' do
            expect(discipline[:stats][:goal][:number]).to eq(450)
            expect(discipline[:stats][:goal][:icon]).to eq('heart-broken')
          end
        end
      end
    end
  end
end
