class CreateThoughts < ActiveRecord::Migration[7.0]
  def change
    create_table :thoughts do |t|
      t.integer :level
      t.string :positive
      t.string :negative

      t.timestamps
    end
  end
end
