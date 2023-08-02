class CreateThoughts < ActiveRecord::Migration[7.0]
  def change
    create_table :thoughts do |t|
      t.string :level
      t.text :positive
      t.text :negative
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
