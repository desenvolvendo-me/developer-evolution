class AddSlugToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :slug, :string
    add_index :students, :slug, unique: true
  end
end
