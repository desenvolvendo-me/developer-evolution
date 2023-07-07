# == Schema Information
#
# Table name: students
#
#  id                        :bigint           not null, primary key
#  challenge                 :integer
#  class_name                :string
#  class_progress            :integer
#  description_career        :string
#  enrollment_date           :date
#  github_commit             :integer
#  github_intensity          :string
#  github_link               :string
#  knowledge                 :string
#  level_number              :integer
#  level_potential           :string
#  level_testimony           :string
#  linkedin_followers        :integer
#  linkedin_intensity        :string
#  linkedin_link             :string
#  linkedin_post_last_month  :integer
#  login                     :string
#  meeting_last              :date
#  meeting_link              :string
#  meeting_next              :date
#  meeting_number            :integer
#  meeting_situation         :string
#  mission_base              :string
#  mission_base_generator    :string
#  mission_base_point        :integer
#  mission_future            :string
#  mission_future_generator  :string
#  mission_future_point      :integer
#  mission_startup           :string
#  mission_startup_generator :string
#  mission_startup_point     :integer
#  mission_vacancy           :string
#  mission_vacancy_generator :string
#  mission_vacancy_point     :integer
#  name                      :string
#  profile_discord           :string
#  profile_hotmart           :string
#  salary                    :float
#  type_career               :string
#  wakatime_intensity        :string
#  wakatime_link             :string
#  wakatime_time             :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id                   :bigint           not null
#
# Indexes
#
#  index_students_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :student do
    login { "jhonesaly" }
    name { "Alyson Jhones" }
    class_name { "13" }
    enrollment_date { "16/01/2023".to_date }
    type_career { "not_technology" }
    description_career { "Engenheiro" }
    salary { 0 }

    knowledge { "m0" }
    profile_hotmart { "https://desenvolvendome-spd.club.hotmart.com/admin/beta/users/detail/PeAyaZA3eW" }
    profile_discord { "https://discord.com/channels/998951206242234421/1007249425200058468/1067486414587052093" }
    level_number { 1 }
    level_potential { "high" }
    level_testimony { "good" }
    class_progress { 37 }

    # Meeting
    meeting_situation { "bought" }
    meeting_last { "17/Feb/2023".to_date }
    meeting_number { 0 }
    meeting_link { "https://drive.google.com/drive/u/0/folders/1zUxuThPc1ldKC4QB_HyqLGA-Teh2pkmb" }

    # Evaluation Social
    github_link { "https://github.com/jhonesaly" }
    github_commit { 10 }
    github_intensity { "very_strong" }
    wakatime_link { "https://wakatime.com/@98661d52-a1fd-4e23-a39b-ba76d31fdfdd" }
    wakatime_time { 78 }
    wakatime_intensity { "strong" }
    linkedin_link { "https://www.linkedin.com/in/alyson-jhones-539767121/" }
    linkedin_followers { 527 }
    linkedin_post_last_month { 4 }
    linkedin_intensity { "very_strong" }

    # Evaluation Method
    challenge { "one" }
    mission_future { "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_" }
    mission_future_generator { "https://docs.google.com/spreadsheets/d/1t-fcIABx8lXscjDQ8_teewif0L6o0KBz3emixeiR2sI" }
    mission_future_point { 1 }
    mission_base { "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_" }
    mission_base_generator { "https://docs.google.com/spreadsheets/d/1ybgxOF1gIbQ2Guw7xmABuOUeBkeb1yvc/edit#gid=1601534537" }
    mission_base_point { 2 }
    mission_vacancy { "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_" }
    mission_vacancy_generator { "https://docs.google.com/spreadsheets/d/1hs4llX2_xT8fat4DN80NmR5wqQCNaot3/edit#gid=825676826" }
    mission_vacancy_point { 5 }
    mission_startup { "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_" }
    mission_startup_generator { "https://docs.google.com/spreadsheets/d/1Jb9bo3OVBY22W9EmGuHcNBNCo4h3BHKw/edit#gid=825676826" }
    mission_startup_point { 10 }

    user
  end
end
