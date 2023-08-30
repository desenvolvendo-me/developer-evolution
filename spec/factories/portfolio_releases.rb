# == Schema Information
#
# Table name: portfolio_releases
#
#  id                        :bigint           not null, primary key
#  milestone_release_link    :string
#  pull_request_release_link :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  portfolio_id              :bigint           not null
#
# Indexes
#
#  index_portfolio_releases_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#
FactoryBot.define do
  factory :potfolio_release do
    portfolio { nil }
    milestone_release_link { "https://github.com/user/repo1/milestones/123" }
    pull_request_release_link { "https://github.com/user/repo1/pull/123" }
  end
end
