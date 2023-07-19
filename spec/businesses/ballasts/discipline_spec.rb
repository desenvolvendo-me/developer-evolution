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

      it "last ok" do
        create(:practice, commit_date: Date.today - 1, commit_total: 5, student: @student)
        create(:practice, commit_date: Date.today, commit_total: 3, student: @student)

        discipline = Ballasts::Discipline.call(resource: @student)

        expect(discipline[:stats][:day][:number]).to eq(3)
        expect(discipline[:stats][:day][:icon]).to eq("heart")
      end

      it "last not ok" do
        create(:practice, commit_date: Date.today - 1, commit_total: 3, student: @student)
        create(:practice, commit_date: Date.today, commit_total: 2, student: @student)

        discipline = Ballasts::Discipline.call(resource: @student)

        expect(discipline[:stats][:day][:number]).to eq(2)
        expect(discipline[:stats][:day][:icon]).to eq("heart-broken")
      end

    end

    context 'week' do

      it 'calculate last week sum' do
        (0..13).each do |days_ago|
          commit_date = Date.today - (14 - days_ago)
          commit_total = rand(2..12)
          create(:practice, commit_date: commit_date, commit_total: commit_total, student: @student)
        end

        last_saturday = Date.today - (Date.today.wday + 1) % 7
        sunday_before_saturday = last_saturday - 6

        practices = @student.practices.where(commit_date: (sunday_before_saturday..last_saturday))
        commit_totals = practices.pluck(:commit_total).sum

        icon = commit_totals >= 21 ? 'heart' : 'heart-broken'
        discipline = Ballasts::Discipline.call(resource: @student)
        expect(discipline[:stats][:week][:number]).to eq(commit_totals)
        expect(discipline[:stats][:week][:icon]).to eq(icon)
      end
    end

    context 'micro_goal'
      it 'calculate last 2 weeks' do
        (0..20).each do |days_ago|
          commit_date = Date.today - (21 - days_ago)
          commit_total = rand(0..12)
          create(:practice, commit_date: commit_date, commit_total: commit_total, student: @student)
        end

        last_saturday = Date.today - (Date.today.wday + 1) % 7
        sunday_two_weeks_before = last_saturday - 13

        practices = @student.practices.where(commit_date: (sunday_two_weeks_before..last_saturday))
        commit_totals = practices.pluck(:commit_total).sum

        discipline = Ballasts::Discipline.call(resource:@student)

        icon = commit_totals >= 42 ? 'heart' : 'heart-broken'
        expect(discipline[:stats][:micro_goal][:number]).to eq(commit_totals)
        expect(discipline[:stats][:week][:icon]).to eq(icon)
      end
    end

    it 'goal' do
      discipline = Ballasts::Discipline.call

      expect(discipline[:stats][:goal]).to eq(discipline_expected[:stats][:goal])
    end

end
