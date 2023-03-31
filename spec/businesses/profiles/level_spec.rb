require 'rails_helper'

RSpec.describe Profiles::Level do

  context 'levels' do
    before do
      @student = create(:student)
    end

    context 'number' do
      context "challenge" do
        it 'one' do
          @student.update(challenge: "one")

          expect(@student.level_number).to eq(2)
        end

        it 'seven' do
          @student.update(challenge: "seven")

          expect(@student.level_number).to eq(8)
        end
      end

      context "mission" do
        context 'future' do
            it 'note >= 7' do
              @student.update(challenge: nil, mission_future_point: 7, mission_future: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

              expect(@student.level_number).to eq(2)
            end

            it 'note < 7' do
              @student.update(challenge: nil, mission_future_point: 5, mission_future: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

              expect(@student.level_number).to eq(1)
            end
        end

        context 'base' do
          it 'note >= 7' do
            @student.update(challenge: nil, mission_base_point: 7, mission_base: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(2)
          end

          it 'note < 7' do
            @student.update(challenge: nil, mission_base_point: 5, mission_base: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(1)
          end
        end

        context 'vacancy' do
          it 'note >= 7' do
            @student.update(challenge: nil, mission_vacancy_point: 7, mission_vacancy: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(2)
          end

          it 'note < 7' do
            @student.update(challenge: nil, mission_vacancy_point: 5, mission_vacancy: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(1)
          end
        end

        context 'startup' do
          it 'note >= 7' do
            @student.update(challenge: nil, mission_startup_point: 7, mission_startup: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(1)
          end

          it 'note < 7' do
            @student.update(challenge: nil, mission_startup_point: 5, mission_startup: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(0)
          end
        end


        context 'level 4' do
          it 'note >= 7' do
            @student.update(challenge: nil, mission_future_point: 7, mission_future: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")
            @student.update(challenge: nil, mission_base_point: 7, mission_base: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")
            @student.update(challenge: nil, mission_vacancy_point: 7, mission_vacancy: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")
            @student.update(challenge: nil, mission_startup_point: 7, mission_startup: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(4)
          end

          it 'note < 7' do
            @student.update(challenge: nil, mission_future_point: 5, mission_future: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")
            @student.update(challenge: nil, mission_base_point: 5, mission_base: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")
            @student.update(challenge: nil, mission_vacancy_point: 5, mission_vacancy: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")
            @student.update(challenge: nil, mission_startup_point: 5, mission_startup: "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_")

            expect(@student.level_number).to eq(0)
          end
        end

      end
    end

  end
end
