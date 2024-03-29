# == Schema Information
#
# Table name: goals
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint           not null
#
# Indexes
#
#  index_goals_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Goal < ApplicationRecord
  belongs_to :student
  has_many :goal_questions, dependent: :destroy #In a delete case of 'goal' all goal_questions are deleted too
end
