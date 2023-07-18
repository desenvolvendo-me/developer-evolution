# == Schema Information
#
# Table name: thoughts
#
#  id         :bigint           not null, primary key
#  level      :integer
#  negative   :string
#  positive   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint
#
# Indexes
#
#  index_thoughts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Thought < ApplicationRecord
  belongs_to :student
end
