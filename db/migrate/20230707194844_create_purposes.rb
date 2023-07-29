class CreatePurposes < ActiveRecord::Migration[7.0]
  def change
    create_table :purposes do |t|
      t.integer :version
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
