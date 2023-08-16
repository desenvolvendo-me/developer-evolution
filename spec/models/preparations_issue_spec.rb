# == Schema Information
#
# Table name: preparations_issues
#
#  id                      :bigint           not null, primary key
#  issue_link              :string
#  pull_request_link       :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  preparations_release_id :bigint           not null
#
# Indexes
#
#  index_preparations_issues_on_preparations_release_id  (preparations_release_id)
#
# Foreign Keys
#
#  fk_rails_...  (preparations_release_id => preparations_releases.id)
#
require 'rails_helper'

RSpec.describe PreparationsIssue, type: :model do
  subject { build(:preparations_issue) }

  # Testar as associações
  it { should belong_to(:preparations_release) }
end
