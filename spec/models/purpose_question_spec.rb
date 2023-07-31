# == Schema Information
#
# Table name: purpose_questions
#
#  id            :bigint           not null, primary key
#  answer        :string
#  description   :string
#  type_question :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  purpose_id    :bigint           not null
#
# Indexes
#
#  index_purpose_questions_on_purpose_id  (purpose_id)
#
# Foreign Keys
#
#  fk_rails_...  (purpose_id => purposes.id)
#
require 'rails_helper'

RSpec.describe PurposeQuestion, type: :model do
  describe 'associations' do
    it { should belong_to(:purpose) }
  end
end
