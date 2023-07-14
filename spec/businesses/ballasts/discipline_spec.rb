require 'rails_helper'

RSpec.describe Ballasts::Discipline do
  let(:discipline_expected) { {
    chart: {
      labels: [
        "Micro Goal 1",
        "Micro Goal 2",
        "Micro Goal 3",
        "Micro Goal 4",
        "Micro Goal 5",
        "Micro Goal 6"
      ],
      datasets: [
        {
          label: "Goal",
          fill: false,
          backgroundColor: "#3cb371",
          borderColor: "#3cb371",
          data: [196, 223, 148, 273, 279, 315],
        },
      ],
    },
    stats: {
      micro_goal_compared: 23,
      day: 2,
      week: 14,
      micro_goal: 33,
      goal: 1234
    }
  } }

  context 'chart' do
    before do
      @student = create(:student)
    end

    it 'discipline' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:chart]).to eq(discipline_expected[:chart])
    end

  end

  context 'stats' do
    before do
      @student = create(:student)
    end

    it 'micro_goal_compared' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:stats][:micro_goal_compared]).to eq(discipline_expected[:stats][:micro_goal_compared])
    end

    it 'day' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:stats][:day]).to eq(discipline_expected[:stats][:day])
    end

    it 'week' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:stats][:week]).to eq(discipline_expected[:stats][:week])
    end

    it 'micro_goal' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:stats][:micro_goal]).to eq(discipline_expected[:stats][:micro_goal])
    end

    it 'goal' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:stats][:goal]).to eq(discipline_expected[:stats][:goal])
    end

  end

end
