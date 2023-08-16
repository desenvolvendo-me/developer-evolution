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
            data: [42, 42, 42, 42, 42, 42]
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
    subject(:discipline) { described_class.call(resource: student) }

    context 'chart' do
      it 'discipline' do
        (0..89).each do |days_ago|
          commit_date = Date.today - (90 - days_ago)
          commit_total = 3
          create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
        end

        expect(discipline[:chart][:datasets][0][:data]).to eq(expected_chart_data[:chart][:datasets][0][:data])
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
          # TODO: Refatorar, mover esse tipo de código para o trait do factorybot
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
            commit_total = 2
            create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
          end
        end

        it 'calculates the sum for the last 2 weeks' do

          expect(discipline[:stats][:micro_goal][:number]).to eq(28)
          expect(discipline[:stats][:micro_goal][:icon]).to eq('heart-broken')
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

          expect(discipline[:stats][:goal][:number]).to eq(450)
          expect(discipline[:stats][:goal][:icon]).to eq('heart')
        end
      end

      describe 'time_available' do
        context 'change' do
          it 'today from 6 to 2' do
            student = create(:student, time_available: 6)
            practice = create(:practice, commit_date: Date.today, commit_total: 3, student: student)
            discipline = described_class.call(resource: student)

            expect(practice.time_available).to eq(6)
            expect(practice.commit_status).to eq("failure")
            expect(discipline[:stats][:day][:number]).to eq(3)
            expect(discipline[:stats][:day][:icon]).to eq('heart-broken')

            student.update(time_available: 2)
            discipline = described_class.call(resource: student)

            expect(practice.time_available).to eq(6)
            expect(practice.commit_status).to eq("failure")
            expect(discipline[:stats][:day][:number]).to eq(3)
            expect(discipline[:stats][:day][:icon]).to eq('heart-broken')
          end

          it 'compare last 2 micro_goals with same time_available' do
            #DADO
            student = create(:student, time_available: 4)

            last_sat_first_micro_goal = (Date.today - (Date.today.wday + 1) % 7) - 7 - 7
            final_date = last_sat_first_micro_goal
            initial_date = final_date - 13

            (initial_date..final_date).each do |commit_date|
              commit_total = 4
              create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
            end

            initial_date = last_sat_first_micro_goal + 1
            final_date = initial_date + 13

            (initial_date..final_date).each do |commit_date|
              commit_total = 5
              create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
            end

            #QUANDO
            discipline = described_class.call(resource: student)

            #ENTÃO
            expect(discipline[:stats][:micro_goal_compared]).to eq(25)
          end

          it 'compare last 2 micro_goals diff time_available' do
            student = create(:student, time_available: 4)

            last_sat_first_micro_goal = (Date.today - (Date.today.wday + 1) % 7) - 7 - 7
            final_date = last_sat_first_micro_goal
            initial_date = final_date - 13

            (initial_date..final_date).each do |commit_date|
              commit_total = 4
              create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
            end
            today_date = Date.today
            allow(Date).to receive(:today).and_return(last_sat_first_micro_goal + 1)
            discipline = described_class.call(resource: student)

            expect(discipline[:stats][:micro_goal][:number]).to eq(56)
            expect(discipline[:stats][:micro_goal][:icon]).to eq('heart-broken')

            number_micro_goal1 = discipline[:stats][:micro_goal][:number]

            allow(Date).to receive(:today).and_return(today_date)
            student.time_available = 2
            initial_date = last_sat_first_micro_goal + 1
            final_date = initial_date + 13

            (initial_date..final_date).each do |commit_date|
              commit_total = 6
              create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
            end
            discipline = described_class.call(resource: student)

            number_micro_goal2 = discipline[:stats][:micro_goal][:number]
            expect(discipline[:stats][:micro_goal][:number]).to eq(84)
            evolucao = ((number_micro_goal2.to_f - number_micro_goal1.to_f) / number_micro_goal1.to_f) * 100
            puts "evoluiu #{evolucao}%"

          end
        end
      end

      context 'student time available 4 hours' do
        before do
          Student.destroy_all
        end
        let(:student) { create(:student, time_available: 4) }
        subject(:discipline) { described_class.call(resource: student) }

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
            expect(discipline[:stats][:goal][:number]).to eq(450)
            expect(discipline[:stats][:goal][:icon]).to eq('heart-broken')
          end
        end
      end
    end
  end
end
