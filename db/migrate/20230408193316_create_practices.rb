class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices do |t|
      t.integer :commit_total
      t.date :commit_date
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
