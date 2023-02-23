require 'rails_helper'

RSpec.describe Intensity::Github do

  context 'github' do
    before do
      @student = create(:student)
    end

    it 'not_found' do
      @student.update(github_link: nil)

      expect(@student.github_intensity).to eq("not_found")
    end

    it 'very_weak' do
      @student.update(github_commit: 1)

      expect(@student.github_intensity).to eq("very_weak")
    end

  end

end
