class AddStudentToMicroGoals < ActiveRecord::Migration[7.0]
  def change
    add_reference :micro_goals, :student, foreign_key: true
  end
end
