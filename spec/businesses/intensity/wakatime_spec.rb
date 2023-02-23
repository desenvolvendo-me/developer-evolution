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

    it 'very_weak' do
      @student.update(wakatime_time: 15)

      expect(@student.wakatime_intensity).to eq("very_weak")
    end

    it 'weak' do
      @student.update(wakatime_time: 60)

      expect(@student.wakatime_intensity).to eq("weak")
    end

    it 'medium' do
      @student.update(wakatime_time: 90)

      expect(@student.wakatime_intensity).to eq("medium")
    end

  end

end
