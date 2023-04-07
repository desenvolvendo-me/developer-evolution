require 'rails_helper'

RSpec.describe Scrapings::Github do

  context 'total_contribution' do
    context "marcodotcastro" do
      before do
        @student = create(:student, enrollment_date: "16/01/2022".to_date,  github_link: "https://github.com/marcodotcastro")
      end

      it '2022' do
        github = Scrapings::Github.new({ resource: @student })

        github.download

        expect(@student.github_commit).to eq(550)
      end
    end
    context "digspencer" do
      before do
        @student = create(:student, enrollment_date: "16/01/2022".to_date,  github_link: "https://github.com/digspencer")
      end

      it '2022' do
        github = Scrapings::Github.new({ resource: @student })

        github.download

        expect(@student.github_commit).to eq(1)
      end
    end
    context "hemershon" do
      before do
        @student = create(:student, enrollment_date: "16/01/2021".to_date,  github_link: "https://github.com/hemershon")
      end

      it '2021' do
        github = Scrapings::Github.new({ resource: @student })

        github.download

        expect(@student.github_commit).to eq(2369)
      end
    end
  end

end