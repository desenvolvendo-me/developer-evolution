require 'rails_helper'

RSpec.describe Intensity::Wakatime do

  context 'wakatime' do
    before do
      @student = create(:student)
    end

    it 'not_found' do
      @student.update(wakatime_link: nil)

      expect(@student.wakatime_intensity).to eq("not_found")
    end

  end

end
