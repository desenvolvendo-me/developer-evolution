class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :repository_link
      t.string :project_link
      t.string :readme_link
      t.references :student

      t.timestamps
    end
  end
end
