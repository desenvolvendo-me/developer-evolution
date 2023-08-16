class AddTimeAvailableToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :time_available, :integer, default: 2
  end
end
