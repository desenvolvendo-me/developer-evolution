# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  end_date      :date
#  percentage    :float
#  start_date    :date
#  task          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  micro_goal_id :bigint           not null
#
# Indexes
#
#  index_tasks_on_micro_goal_id  (micro_goal_id)
#
# Foreign Keys
#
#  fk_rails_...  (micro_goal_id => micro_goals.id)
#
class Task < ApplicationRecord
  belongs_to :micro_goal
end
