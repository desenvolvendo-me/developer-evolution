class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :class_name
      t.date :enrollment_date
      t.string :type_career
      t.string :description_career
      t.float :salary

      t.string :knowledge
      t.string :profile_hotmart
      t.string :profile_discord
      t.integer :level_number
      t.string :level_potential
      t.string :level_testimony
      t.integer :class_progress

      t.string :meeting_situation
      t.date :meeting_last
      t.date :meeting_next
      t.integer :meeting_number
      t.string :meeting_link

      t.string :github_link
      t.integer :github_commit
      t.string :github_intensity
      t.string :wakatime_link
      t.integer :wakatime_time
      t.string :wakatime_intensity
      t.string :linkedin_link
      t.integer :linkedin_followers
      t.integer :linkedin_post_last_month
      t.string :linkedin_intensity

      t.integer :challenge
      t.string :mission_future
      t.string :mission_future_generator
      t.integer :mission_future_point
      t.string :mission_base
      t.string :mission_base_generator
      t.integer :mission_base_point
      t.string :mission_vacancy
      t.string :mission_vacancy_generator
      t.integer :mission_vacancy_point
      t.string :mission_startup
      t.string :mission_startup_generator
      t.integer :mission_startup_point

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
