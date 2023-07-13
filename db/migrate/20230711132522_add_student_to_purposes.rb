class AddStudentToPurposes < ActiveRecord::Migration[7.0]
  def change
    add_reference :purposes, :student, foreign_key: true
  end
end
