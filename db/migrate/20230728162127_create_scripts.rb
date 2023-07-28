class CreateScripts < ActiveRecord::Migration[7.0]
  def change
    create_table :scripts do |t|
      t.string :category
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
