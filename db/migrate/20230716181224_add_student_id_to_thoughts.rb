class AddStudentIdToThoughts < ActiveRecord::Migration[7.0]
  def change
    add_reference :thoughts, :student, null:false, foreign_key: true
  end
end
