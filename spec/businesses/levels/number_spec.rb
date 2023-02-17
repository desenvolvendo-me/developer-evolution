require 'rails_helper'

RSpec.describe Levels::Number do

  context 'levels' do
    before do
      @student = create(:student)
    end

    context 'number' do
      context "challenge" do
        it 'one' do
          @student.update(challenge: "one")

          expect(@student.level_number).to eq(1)
        end

        it 'seven' do
          @student.update(challenge: "seven")

          expect(@student.level_number).to eq(7)
        end
      end
    end

  end
end
