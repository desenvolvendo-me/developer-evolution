class CreateRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :routines do |t|
      t.integer :day_of_the_week
      t.time :hour
      t.string :activity
      t.string :priority
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
