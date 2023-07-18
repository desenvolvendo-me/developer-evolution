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

    context 'day' do

      it "commit before enrollment date" do
        @student.enrollment_date = Date.today - 1
        create(:practice, commit_date: Date.today, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today - 1, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today - 2, commit_total: 6, student: @student)

        discipline = Ballasts::Discipline.call(resource: @student)

        expect(discipline[:stats][:day]).to eq(3)
      end

      it "commit after enrollment date" do
        @student.enrollment_date = Date.today - 2
        create(:practice, commit_date: Date.today, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today - 1, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today - 2, commit_total: 6, student: @student)

        discipline = Ballasts::Discipline.call(resource: @student)

        expect(discipline[:stats][:day]).to eq(4)
      end

    end

    context 'week' do

      it 'calculate week average' do
        @student.enrollment_date = Date.today - 8
        create(:practice, commit_date: Date.today, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today - 1, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today - 2, commit_total: 6, student: @student)
        create(:practice, commit_date: Date.today - 3, commit_total: 5, student: @student)
        create(:practice, commit_date: Date.today - 5, commit_total: 7, student: @student)
        create(:practice, commit_date: Date.today - 6, commit_total: 6, student: @student)
        create(:practice, commit_date: Date.today - 7, commit_total: 2, student: @student)

        discipline = Ballasts::Discipline.call(resource: @student)

        wday = Date.today.wday
        result = nil

        case wday
        when 0 # Domingo
          result = 3
        when 1 # Segunda-feira
          result = 6
        when 2 # Terça-feira
          result = 12
        when 3
          result = 17
        when 4
          result = 24
        when 5
          result = 30
        when 6
          result = 32
        end
        expect(discipline[:stats][:week]).to eq(result)
      end
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
