require 'rails_helper'

RSpec.describe Profiles::Potential do

  context 'potentials' do
    before do
      @student = create(:student)
    end

    it 'not_started' do
      @student.update(class_progress: 9)

      expect(@student.level_potential).to eq("not_started")
    end

    context "gave_up" do
      it 'career' do
        @student.update(class_progress: 14, wakatime_time: 15)

        expect(@student.level_potential).to eq("gave_up_career")
      end

      it 'mentoring' do
        @student.update(class_progress: 14, wakatime_time: 60)

        expect(@student.level_potential).to eq("gave_up_mentoring")
      end
    end

    it 'almost_goal' do
      @student.update(type_career: "technology", salary: 3001, class_progress: 33)

      expect(@student.level_potential).to eq("almost_goal")
    end

    it 'goal' do
      @student.update(type_career: "not_technology", salary: 5001, class_progress: 51)

      expect(@student.level_potential).to eq("goal")
    end

    it 'no_testimony' do
      @student.update(type_career: "technology", salary: 5001)

      expect(@student.level_potential).to eq("no_testimony")
    end

    context "low" do
      before do
        @student.update(type_career: "not_technology", salary: 2000)
        @student.update(wakatime_time: 15)
      end

      it 'wakatime vw' do
        expect(@student.level_potential).to eq("low")
      end

      it 'github s' do
        @student.update(github_commit: 10)

        expect(@student.level_potential).to eq("low")
      end

      it 'linkedin s' do
        @student.update(enrollment_date: Date.today - 10)
        @student.update(linkedin_followers: 100)
        @student.update(linkedin_post_last_month: 20)

        expect(@student.level_potential).to eq("low")
      end
    end

    context "medium" do
      before do
        @student.update(type_career: "not_technology", salary: 2000)
      end

      it 'wakatime m' do
        @student.update(wakatime_time: 90)

        expect(@student.level_potential).to eq("medium")
      end

      it 'wakatime w + github m + linkedin m' do
        @student.update(wakatime_time: 60)

        @student.update(github_commit: 4)

        @student.update(enrollment_date: Date.today - 10)
        @student.update(linkedin_followers: 60)
        @student.update(linkedin_post_last_month: 12)

        expect(@student.level_potential).to eq("medium")
      end

    end
  end
end
