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
    subject(:discipline) { described_class.call(resource: student) }

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

          it 'week from 4 to 2' do
            student = create(:student, time_available: 4)
            final_date = (Date.today - (Date.today.wday + 1) % 7) - 7
            initial_date = final_date - 6

            (initial_date..final_date).each do |commit_date|
              commit_total = 4
              create(:practice, commit_date: commit_date, commit_total: commit_total, student: student)
            end
            allow(Date).to receive(:today).and_return(Date.today - 8)
            discipline = described_class.call(resource: student)

            expect(discipline[:stats][:week][:number]).to eq(28)
            expect(discipline[:stats][:week][:icon]).to eq('heart-broken')

            student.time_available = 2
            discipline = described_class.call(resource: student)

            expect(discipline[:stats][:week][:icon]).to eq('heart-broken')


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
