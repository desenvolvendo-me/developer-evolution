class AddStudentRefToMicroGoals < ActiveRecord::Migration[7.0]
  def change
    add_reference :micro_goals, :student, null: false, foreign_key: true
  end
end
