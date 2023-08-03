# == Schema Information
#
# Table name: tests_issues
#
#  id                :bigint           not null, primary key
#  issue_link        :string
#  pull_request_link :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tests_battle_id   :bigint           not null
#
# Indexes
#
#  index_tests_issues_on_tests_battle_id  (tests_battle_id)
#
# Foreign Keys
#
#  fk_rails_...  (tests_battle_id => tests_battles.id)
#
FactoryBot.define do
  factory :tests_issue do
    tests_battle { nil }
    issue_link { "MyString" }
    pull_request_link { "MyString" }
  end
end
