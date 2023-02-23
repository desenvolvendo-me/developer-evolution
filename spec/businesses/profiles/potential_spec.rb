require 'rails_helper'

RSpec.describe Profiles::Potential do

  context 'potentials' do
    before do
      @student = create(:student)
    end

    it 'not_started' do
      @student.update(class_progress: 9)

      expect(@student.level_potencial).to eq("not_started")
    end

    context "gave_up" do
      it 'career' do
        @student.update(class_progress: 14, wakatime_time: 15)

        expect(@student.level_potencial).to eq("gave_up_career")
      end

      it 'mentoring' do
        @student.update(class_progress: 14, wakatime_time: 60)

        expect(@student.level_potencial).to eq("gave_up_mentoring")
      end
    end

    it 'almost_goal' do
      @student.update(type_career: "technology", salary: 3001, class_progress: 33)

      expect(@student.level_potencial).to eq("almost_goal")
    end

    it 'goal' do
      @student.update(type_career: "not_technology", salary: 5001, class_progress: 51)

      expect(@student.level_potencial).to eq("goal")
    end

    it 'no_testimony' do
      @student.update(type_career: "technology", salary: 5001)

      expect(@student.level_potencial).to eq("no_testimony")
    end

  end
end
