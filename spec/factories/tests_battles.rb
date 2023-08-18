# == Schema Information
#
# Table name: tests_battles
#
#  id                        :bigint           not null, primary key
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
FactoryBot.define do
  factory :tests_battle do
    test { nil }
    milestone_release_link { "https://github.com/user/repo1/milestones/123" }
    pull_request_release_link { "https://github.com/user/repo1/pull/123" }
  end
end
