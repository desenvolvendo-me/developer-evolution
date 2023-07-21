class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :micro_goal, null: false, foreign_key: true
      t.string :task
      t.date :start_date
      t.date :end_date
      t.integer :percentage

      t.timestamps
    end
  end
end
