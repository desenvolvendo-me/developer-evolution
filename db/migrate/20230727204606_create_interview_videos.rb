class CreateInterviewVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :interview_videos do |t|
      t.references :interview, null: false, foreign_key: true
      t.string :video_link

      t.timestamps
    end
  end
end
