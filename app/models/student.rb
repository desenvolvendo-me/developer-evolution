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
class Student < ApplicationRecord
  belongs_to :user
  has_many :practices
  has_many :thoughts
  has_many :scripts

  enum type_career: { technology: "technology", not_technology: "not_technology" }, _suffix: true
  enum level_potential: { low: "low", medium: "medium", high: "high", almost_goal: "almost_goal", goal: "goal", not_started: "not_started", no_testimony: "no_testimony", gave_up_career: "gave_up_career", gave_up_mentoring: "gave_up_mentoring" }, _suffix: true
  enum level_testimony: { excellent: "excellent", great: "great", good: "good" }
  enum meeting_situation: { bought: "bought", won: "won", not_bought: "not_bought" }
  enum github_intensity: { not_found: "not_found", very_weak: "very_weak", weak: "weak", medium: "medium", strong: "strong", very_strong: "very_strong" }, _prefix: :github
  enum wakatime_intensity: { not_found: "not_found", very_weak: "very_weak", weak: "weak", medium: "medium", strong: "strong", very_strong: "very_strong" }, _prefix: :wakatime
  enum linkedin_intensity: { not_found: "not_found", very_weak: "very_weak", weak: "weak", medium: "medium", strong: "strong", very_strong: "very_strong" }, _prefix: :linkedin
  enum challenge: { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, }
  enum knowledge: { m0: 0, m3: 3, m6: 6, a1: 12, a2: 24, a5: 60, a10: 120 }

end
