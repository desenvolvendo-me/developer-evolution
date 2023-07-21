class CreateMicroGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :micro_goals do |t|
      t.string :micro_goal

      t.timestamps
    end
  end
end
