class CreatePreparations < ActiveRecord::Migration[7.0]
  def change
    create_table :preparations do |t|
      t.string :name
      t.string :project
      t.text :readme
      t.string :link
      t.integer :release
      t.string :release_type

      t.timestamps
    end
  end
end
