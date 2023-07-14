# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  micro_goal :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint
#
# Indexes
#
#  index_micro_goals_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class MicroGoal < ApplicationRecord
  belongs_to :student
  has_many :tasks
end
