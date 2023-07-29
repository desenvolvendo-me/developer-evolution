class AddMicroGoalToMicroGoalTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :micro_goal_tasks, :micro_goal, null: false, foreign_key: true
  end
end
