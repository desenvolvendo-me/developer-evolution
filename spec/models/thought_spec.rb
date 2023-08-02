# == Schema Information
#
# Table name: thoughts
#
#  id         :bigint           not null, primary key
#  level      :string
#  negative   :text
#  positive   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_thoughts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Thought, type: :model do
  describe 'associations' do
    it { should belong_to(:student) }
  end
end
