# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  micro_goal :string
#  string     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MicroGoal < ApplicationRecord
  belongs_to :student
  has_many :tasks
end
