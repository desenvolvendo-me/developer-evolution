# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  version    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_purposes_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Purpose, type: :model do
  describe 'associations' do
    it { should belong_to(:student) }
  end
end
