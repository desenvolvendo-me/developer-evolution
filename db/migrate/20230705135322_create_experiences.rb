class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :student, null: false, foreign_key: true
      t.text :content
      t.string :category
      t.integer :level

      t.timestamps
    end
  end
end
