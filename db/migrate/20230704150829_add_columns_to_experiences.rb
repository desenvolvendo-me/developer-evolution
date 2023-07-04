class AddColumnsToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :category, :string
    add_column :experiences, :level, :integer
    add_column :experiences, :week, :integer
  end
end
