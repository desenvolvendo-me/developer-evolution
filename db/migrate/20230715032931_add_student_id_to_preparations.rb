class AddStudentIdToPreparations < ActiveRecord::Migration[7.0]
  def change
    add_reference :preparations, :student, null: false, foreign_key: true
  end
end
