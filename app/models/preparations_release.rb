# == Schema Information
#
# Table name: preparations_releases
#
#  id                        :bigint           not null, primary key
#  milestone_release_link    :string
#  pull_request_release_link :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  preparation_id            :bigint           not null
#
# Indexes
#
#  index_preparations_releases_on_preparation_id  (preparation_id)
#
# Foreign Keys
#
#  fk_rails_...  (preparation_id => preparations.id)
#
class PreparationsRelease < ApplicationRecord
  belongs_to :preparation
  has_many :preparations_issues, dependent: :destroy
end
