class RemoveForeignKeyFromMicroGoals < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :tasks, column: :micro_goal_id
  end
end