require 'rails_helper'

RSpec.describe Intensity::Linkedin do

  context 'linkedin' do
    before do
      @student = create(:student)
    end

    it 'not_found' do
      @student.update(linkedin_link: nil, linkedin_followers: nil, linkedin_intensity: nil, linkedin_post_last_month: nil)

      Profiles::Potential.call({ resource: @student })

      expect(@student.linkedin_intensity).to eq("not_found")
    end

    it 'very_weak' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 20)
      @student.update(linkedin_post_last_month: 4)

      Profiles::Potential.call({ resource: @student })

      expect(@student.linkedin_intensity).to eq("very_weak")
    end

    it 'weak' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 40)
      @student.update(linkedin_post_last_month: 8)

      Profiles::Potential.call({ resource: @student })

      expect(@student.linkedin_intensity).to eq("weak")
    end

    it 'medium' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 60)
      @student.update(linkedin_post_last_month: 12)

      Profiles::Potential.call({ resource: @student })

      expect(@student.linkedin_intensity).to eq("medium")
    end

    it 'strong' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 80)
      @student.update(linkedin_post_last_month: 16)

      Profiles::Potential.call({ resource: @student })

      expect(@student.linkedin_intensity).to eq("strong")
    end

    it 'very_strong' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 100)
      @student.update(linkedin_post_last_month: 20)

      Profiles::Potential.call({ resource: @student })

      expect(@student.linkedin_intensity).to eq("very_strong")
    end

  end

end
