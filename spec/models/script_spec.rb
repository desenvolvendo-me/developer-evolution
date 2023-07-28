# == Schema Information
#
# Table name: scripts
#
#  id         :bigint           not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_scripts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Script, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
