require 'rails_helper'

RSpec.describe Intensity::Wakatime do

  context 'wakatime' do
    before do
      @student = create(:student)
    end

    it 'not_found' do
      @student.update(wakatime_link: nil, wakatime_intensity: nil, wakatime_time: nil)

      Profiles::Potential.call({ resource: @student })

      expect(@student.wakatime_intensity).to eq("not_found")
    end

    it 'very_weak' do
      @student.update(wakatime_time: 15)

      Profiles::Potential.call({ resource: @student })

      expect(@student.wakatime_intensity).to eq("very_weak")
    end

    it 'weak' do
      @student.update(wakatime_time: 60)

      Profiles::Potential.call({ resource: @student })

      expect(@student.wakatime_intensity).to eq("weak")
    end

    it 'medium' do
      @student.update(wakatime_time: 90)

      Profiles::Potential.call({ resource: @student })

      expect(@student.wakatime_intensity).to eq("medium")
    end

    it 'strong' do
      @student.update(wakatime_time: 180)

      Profiles::Potential.call({ resource: @student })

      expect(@student.wakatime_intensity).to eq("strong")
    end

    it 'very_strong' do
      @student.update(wakatime_time: 270)

      Profiles::Potential.call({ resource: @student })

      expect(@student.wakatime_intensity).to eq("very_strong")
    end

  end

end
