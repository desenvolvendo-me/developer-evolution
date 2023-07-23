# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  percentage :float
#  start_date :date
#  task       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :micro_goal
end
