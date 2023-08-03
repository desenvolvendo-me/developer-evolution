# == Schema Information
#
# Table name: tests_battles
#
#  id                        :bigint           not null, primary key
#  battle                    :string
#  milestone_release_link    :string
#  pull_request_release_link :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  test_id                   :bigint           not null
#
# Indexes
#
#  index_tests_battles_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
require 'rails_helper'

RSpec.describe TestsBattle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
