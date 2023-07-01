class CreateMicroGoal < ActiveRecord::Migration[7.0]
  def change
    create_table :micro_goals do |t|
      t.string :micro_goal
      t.string :task
      t.date :start_date
      t.date :end_date
      t.float :percentage
      t.timestamps
    end
  end
end
