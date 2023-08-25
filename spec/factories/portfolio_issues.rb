# == Schema Information
#
# Table name: portfolio_issues
#
#  id                   :bigint           not null, primary key
#  issue_link           :string
#  pull_request_link    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  portfolio_release_id :bigint           not null
#
# Indexes
#
#  index_portfolio_issues_on_portfolio_release_id  (portfolio_release_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_release_id => portfolio_releases.id)
#
FactoryBot.define do
  factory :portfolio_issue do
    portfolio_release { nil }
    issue_link { "https://github.com/user/repo1/issues/12" }
    pull_request_link { "https://github.com/user/repo1/tree/branch_12" }
  end
end
