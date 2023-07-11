require 'rails_helper'

RSpec.describe Profiles::Potential do

  context 'potentials' do
    before do
      @student = create(:student)
    end

    it "not_found" do
      @student.update(github_link: nil)

      Profiles::Potential.call({ resource: @student })

      expect(@student.level_potential).to eq("not_started")
    end

    it 'not_started' do
      @student.update(class_progress: 9)

      Profiles::Potential.call({ resource: @student })

      expect(@student.level_potential).to eq("not_started")
    end

    context "gave_up" do
      it 'career' do
        @student.update(class_progress: 14, wakatime_activity_average: 15)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("gave_up_career")
      end

      it 'mentoring' do
        @student.update(class_progress: 14, wakatime_activity_average: 60)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("gave_up_mentoring")
      end
    end

    it 'almost_goal' do
      @student.update(type_career: "technology", salary: 3001, class_progress: 33)

      Profiles::Potential.call({ resource: @student })

      expect(@student.level_potential).to eq("almost_goal")
    end

    it 'goal' do
      @student.update(type_career: "not_technology", salary: 5001, class_progress: 51)

      Profiles::Potential.call({ resource: @student })

      expect(@student.level_potential).to eq("goal")
    end

    it 'no_testimony' do
      @student.update(type_career: "technology", salary: 5001)

      Profiles::Potential.call({ resource: @student })

      expect(@student.level_potential).to eq("no_testimony")
    end

    context "low" do
      before do
        @student.update(type_career: "not_technology", salary: 2000)
        @student.update(wakatime_activity_average: 15)
      end

      it 'wakatime vw' do

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("low")
      end

      it 'github s' do
        @student.update(github_commit_average: 10)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("low")
      end

      it 'linkedin s' do
        student_attributes = {
          enrollment_date: Date.today - 10,
          linkedin_followers: 100,
          linkedin_post_last_month: 20
        }
        @student.update(student_attributes)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("low")
      end
    end

    context "medium" do
      before do
        @student.update(type_career: "not_technology", salary: 2000)
      end

      it 'wakatime m' do
        @student.update(wakatime_activity_average: 90)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("medium")
      end

      it 'wakatime w + github m + linkedin m' do
        student_attributes = {
          wakatime_activity_average: 60,
          github_commit_average: 4,
          enrollment_date: Date.today - 10,
          linkedin_followers: 60,
          linkedin_post_last_month: 12
        }
        @student.update(student_attributes)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("medium")
      end

      it 'wakatime w + github w + linkedin s' do
        student_attributes = {
          wakatime_activity_average: 60,
          github_commit_average: 2,
          enrollment_date: Date.today - 10,
          linkedin_followers: 80,
          linkedin_post_last_month: 16
        }
        @student.update(student_attributes)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("medium")
      end
    end

    context "high" do
      before do
        @student.update(type_career: "not_technology", salary: 2000)
      end

      it 'wakatime s' do
        @student.update(wakatime_activity_average: 180)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("high")
      end

      it 'wakatime m + github s + linkedin w' do
        student_attributes = {
          wakatime_activity_average: 90,
          github_commit_average: 10,
          enrollment_date: Date.today - 10,
          linkedin_followers: 40,
          linkedin_post_last_month: 8
        }
        @student.update(student_attributes)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("high")
      end

      it 'wakatime m + github m + linkedin s' do
        student_attributes = {
          wakatime_activity_average: 90,
          github_commit_average: 4,
          enrollment_date: Date.today - 10,
          linkedin_followers: 80,
          linkedin_post_last_month: 16
        }
        @student.update(student_attributes)

        Profiles::Potential.call({ resource: @student })

        expect(@student.level_potential).to eq("high")
      end

    end
  end
end
