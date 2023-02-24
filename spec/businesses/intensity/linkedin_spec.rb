require 'rails_helper'

RSpec.describe Intensity::Linkedin do

  context 'linkedin' do
    before do
      @student = create(:student)
    end

    it 'not_found' do
      @student.update(linkedin_link: nil)

      expect(@student.linkedin_intensity).to eq("not_found")
    end

  end

end
