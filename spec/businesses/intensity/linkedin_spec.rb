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

    it 'very_weak' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 20)
      @student.update(linkedin_post_last_month: 4)

      expect(@student.linkedin_intensity).to eq("very_weak")
    end

    it 'weak' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 40)
      @student.update(linkedin_post_last_month: 8)

      expect(@student.linkedin_intensity).to eq("weak")
    end

    it 'medium' do
      @student.update(enrollment_date: Date.today - 10)
      @student.update(linkedin_followers: 60)
      @student.update(linkedin_post_last_month: 12)

      expect(@student.linkedin_intensity).to eq("medium")
    end

  end

end
