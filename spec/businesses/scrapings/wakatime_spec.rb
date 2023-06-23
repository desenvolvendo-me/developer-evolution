require 'rails_helper'

RSpec.describe Scrapings::Wakatime do

  context 'total_activity' do
    context "marcodotcastro" do
      before do
        @student = create(:student, enrollment_date: "16/01/2023".to_date, wakatime_link: "https://wakatime.com/@marcodotcastro")
      end

      it '2023' do
        github = Scrapings::Wakatime.new({ resource: @student })

        github.pull_activities

        expect(@student.practices.sum(:activity_total)).to eq(294369)
        expect(@student.wakatime_activity_total).to eq(294369)
      end
    end
  end

  context 'average_activity' do
    context "marcodotcastro" do
      before do
        @student = create(:student, enrollment_date: "01/02/2023".to_date, wakatime_link: "https://wakatime.com/@marcodotcastro")
      end

      it '04-2023' do
        github = Scrapings::Wakatime.new({ resource: @student, final_enrollment_date: "30/04/2023".to_date })

        github.pull_activities

        expect(@student.wakatime_activity_average).to eq(638)
      end

      it '05-2023' do
        github = Scrapings::Wakatime.new({ resource: @student, final_enrollment_date: "31/05/2023".to_date })

        github.pull_activities

        expect(@student.wakatime_activity_average).to eq(492)
      end
    end
  end

  context "convert_activity_time" do
    it "3s" do
      expect(Scrapings::Wakatime.new.send(:convert_activity_to_second, "3s")).to eq(3)
    end

    it "3m" do
      expect(Scrapings::Wakatime.new.send(:convert_activity_to_second, "3m")).to eq(180)
    end

    it "3h 33m" do
      expect(Scrapings::Wakatime.new.send(:convert_activity_to_second, "3h 33m")).to eq(12780)
    end
  end

end