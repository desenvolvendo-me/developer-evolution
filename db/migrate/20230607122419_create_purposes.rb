class CreatePurposes < ActiveRecord::Migration[7.0]
  def change
    create_table :purposes do |t|
      t.string :version, limit: 5
      t.string :period, limit: 20
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
