require 'rails_helper'

RSpec.describe Intensity::Github do

  context 'github' do
    before do
      @student = create(:student)
    end

    it 'not_found' do
      @student.update(github_link: nil, github_commit_average: nil, github_intensity: nil)

      Profiles::Potential.call({ resource: @student })

      expect(@student.github_intensity).to eq("not_found")
    end

    it 'very_weak' do
      @student.update(github_commit_average: 1)

      Profiles::Potential.call({ resource: @student })

      expect(@student.github_intensity).to eq("very_weak")
    end

    it 'weak' do
      @student.update(github_commit_average: 2)

      Profiles::Potential.call({ resource: @student })

      expect(@student.github_intensity).to eq("weak")
    end

    it 'medium' do
      @student.update(github_commit_average: 4)

      Profiles::Potential.call({ resource: @student })

      expect(@student.github_intensity).to eq("medium")
    end

    it 'strong' do
      @student.update(github_commit_average: 10)

      Profiles::Potential.call({ resource: @student })

      expect(@student.github_intensity).to eq("strong")
    end

    it 'very_strong' do
      @student.update(github_commit_average: 20)

      Profiles::Potential.call({ resource: @student })

      expect(@student.github_intensity).to eq("very_strong")
    end

  end

end
