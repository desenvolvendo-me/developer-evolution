class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :repository_link
      t.string :project_link
      t.string :readme_link
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
