# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  micro_goal :string
#  percentage :float
#  start_date :date
#  task       :string
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
  validates :student_id, :micro_goal, :task, :start_date, :end_date, :percentage, presence: true
end
