require 'rails_helper'

RSpec.describe Profiles::Potential do

  context 'potentials' do
    before do
      @student = create(:student)
    end

    it 'no_testimony' do
      @student.update(type_career: "technology", salary: 5001)

      expect(@student.level_potencial).to eq("no_testimony")
    end

  end
end
