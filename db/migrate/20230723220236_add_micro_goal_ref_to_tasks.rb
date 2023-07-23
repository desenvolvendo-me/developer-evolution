class AddMicroGoalRefToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :micro_goal, null: false, foreign_key: true
  end
end
