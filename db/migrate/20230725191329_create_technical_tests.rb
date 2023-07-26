class CreateTechnicalTests < ActiveRecord::Migration[7.0]
  def change
    create_table :technical_tests do |t|
      t.string :project
      t.text :readme
      t.string :link
      t.integer :battle
      t.string :release_type
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
