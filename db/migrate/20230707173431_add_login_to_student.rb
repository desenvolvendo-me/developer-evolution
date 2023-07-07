class AddLoginToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :login, :string
  end
end
