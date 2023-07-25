class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.string :interview_type
      t.integer :video_number
      t.string :answer

      t.timestamps
    end
  end
end
