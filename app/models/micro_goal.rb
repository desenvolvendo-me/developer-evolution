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
#
class MicroGoal < ApplicationRecord
end
