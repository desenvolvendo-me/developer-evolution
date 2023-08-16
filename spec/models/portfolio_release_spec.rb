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
require 'rails_helper'

RSpec.describe PortfolioRelease, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
