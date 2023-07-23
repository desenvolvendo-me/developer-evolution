require 'rails_helper'

RSpec.describe Ballasts::Discipline do
  let(:student) { create(:student) }
  let(:expected_chart_data) do
    {
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
            data: [196, 223, 148, 273, 279, 315]
          }
        ]
      },
      stats: {
        micro_goal_compared: 23,
        day: 2,
        week: 14,
        micro_goal: 33,
        goal: 1234
      }
    }
  end

  describe '.call' do
    subject(:discipline) { described_class.call(resource: student, time_available: 2) }

    context 'chart' do
      xit 'returns the discipline chart' do
        expect(discipline[:chart]).to eq(expected_chart_data[:chart])
      end
    end

    context 'stats' do
      describe 'micro_goal_compared' do
        xit 'returns micro_goal_compared' do
          expect(discipline[:stats][:micro_goal_compared]).to eq(expected_chart_data[:stats][:micro_goal_compared])
        end
      end

      describe 'day' do
        context 'when last day is ok' do
          before do
            create(:practice, commit_date: Date.today - 1, commit_total: 5, student: student)
            create(:practice, commit_date: Date.today, commit_total: 3, student: student)
          end

          it 'returns the last day stats' do
            expect(discipline[:stats][:day][:number]).to eq(3)
            expect(discipline[:stats][:day][:icon]).to eq('heart')
          end
        end

        context 'when last day is not ok' do
          before do
            create(:practice, commit_date: Date.today - 1, commit_total: 3, student: student)
            create(:practice, commit_date: Date.today, commit_total: 2, student: student)
          end

          it 'returns the last day stats' do
            expect(discipline[:stats][:day][:number]).to eq(2)
            expect(discipline[:stats][:day][:icon]).to eq('heart-broken')
          end
        end
      end

      describe 'week' do
        it 'last week heart' do
          #TODO: Refatorar, mover esse tipo de código para o trait do factorybot
          (0..13).each do |days_ago|
            commit_date = Date.today - (14 - days_ago)
            commit_total = 3
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end

          expect(discipline[:stats][:week][:number]).to eq(21)
          expect(discipline[:stats][:week][:icon]).to eq("heart")
        end

        it 'last week heart-broken' do
          (0..13).each do |days_ago|
            commit_date = Date.today - (14 - days_ago)
            commit_total = 2
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end

          expect(discipline[:stats][:week][:number]).to eq(14)
          expect(discipline[:stats][:week][:icon]).to eq("heart-broken")
        end
      end

      describe 'micro_goal' do
        before do
          (0..20).each do |days_ago|
            commit_date = Date.today - (21 - days_ago)
            commit_total = rand(0..12)
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end
        end

        it 'calculates the sum for the last 2 weeks' do
          last_saturday = Date.today - (Date.today.wday + 1) % 7
          sunday_two_weeks_before = last_saturday - 13

          practices = student.practices.where(commit_date: (sunday_two_weeks_before..last_saturday))
          commit_totals = practices.pluck(:commit_total).sum

          icon = commit_totals >= 42 ? 'heart' : 'heart-broken'

          expect(discipline[:stats][:micro_goal][:number]).to eq(commit_totals)
          expect(discipline[:stats][:micro_goal][:icon]).to eq(icon)
        end
      end

      describe 'goal' do
        before do
          (0..100).each do |days_ago|
            commit_date = Date.today - (101 - days_ago)
            commit_total = rand(0..12)
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end
        end

        it 'returns the commits from the last 3 months' do
          last_saturday = Date.today - (Date.today.wday + 1) % 7
          three_months_back = last_saturday - 90

          practices = student.practices.where(commit_date: (three_months_back..last_saturday))
          commit_totals = practices.pluck(:commit_total).sum

          icon = commit_totals >= 252 ? 'heart' : 'heart-broken'

          expect(discipline[:stats][:goal][:number]).to eq(commit_totals)
          expect(discipline[:stats][:goal][:icon]).to eq(icon)
        end
      end
    end

    context 'time available 4 hours' do
      subject(:discipline) { described_class.call(resource: student, time_available: 4) }

      describe 'day' do
        context 'when last day is ok' do
          before do
            create(:practice, commit_date: Date.today - 1, commit_total: 5, student: student)
            create(:practice, commit_date: Date.today, commit_total: 6, student: student)
          end

          it 'returns the last day stats' do
            expect(discipline[:stats][:day][:number]).to eq(6)
            expect(discipline[:stats][:day][:icon]).to eq('heart')
          end
        end

        context 'when last day is not ok' do
          before do
            create(:practice, commit_date: Date.today - 1, commit_total: 3, student: student)
            create(:practice, commit_date: Date.today, commit_total: 5, student: student)
          end

          it 'returns the last day stats' do
            expect(discipline[:stats][:day][:number]).to eq(5)
            expect(discipline[:stats][:day][:icon]).to eq('heart-broken')
          end
        end
      end

      describe 'week' do
        before do
          (0..13).each do |days_ago|
            commit_date = Date.today - (14 - days_ago)
            commit_total = 7
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end
        end

        it 'calculates the correct sum for the last week' do
          last_saturday = Date.today - (Date.today.wday + 1) % 7
          sunday_before_saturday = last_saturday - 6

          practices = student.practices.where(commit_date: (sunday_before_saturday..last_saturday))
          commit_totals = practices.pluck(:commit_total).sum

          icon = commit_totals >= 42 ? 'heart' : 'heart-broken'

          expect(discipline[:stats][:week][:number]).to eq(49)
          expect(discipline[:stats][:week][:icon]).to eq('heart')
        end
      end

      describe 'micro_goal' do
        before do
          (0..20).each do |days_ago|
            commit_date = Date.today - (21 - days_ago)
            commit_total = 7
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end
        end

        it 'calculates the sum for the last 2 weeks' do
          last_saturday = Date.today - (Date.today.wday + 1) % 7
          sunday_two_weeks_before = last_saturday - 13

          practices = student.practices.where(commit_date: (sunday_two_weeks_before..last_saturday))
          commit_totals = practices.pluck(:commit_total).sum

          icon = commit_totals >= 84 ? 'heart' : 'heart-broken'

          expect(discipline[:stats][:micro_goal][:number]).to eq(98)
          expect(discipline[:stats][:micro_goal][:icon]).to eq('heart')
        end
      end

      describe 'goal' do
        before do
          (0..100).each do |days_ago|
            commit_date = Date.today - (101 - days_ago)
            commit_total = 5
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end
        end

        it 'returns the commits from the last 3 months' do
          last_saturday = Date.today - (Date.today.wday + 1) % 7
          three_months_back = last_saturday - 90

          practices = student.practices.where(commit_date: (three_months_back..last_saturday))
          commit_totals = practices.pluck(:commit_total).sum

          icon = commit_totals >= 504 ? 'heart' : 'heart-broken'

          expect(discipline[:stats][:goal][:number]).to eq(455)
          expect(discipline[:stats][:goal][:icon]).to eq('heart-broken')
        end
      end
    end
  end
end
