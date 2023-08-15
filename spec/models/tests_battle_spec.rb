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
require 'rails_helper'

RSpec.describe TestsBattle, type: :model do
  subject { build(:tests_battle) }

  # Testar as associações
  it { should belong_to(:test) }
  it { should have_many(:tests_issues).dependent(:destroy) }
end
