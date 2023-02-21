# == Schema Information
#
# Table name: students
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  class_name               :string
#  enrollment_date          :date
#  knowledge                :string
#  profile_hotmart          :string
#  profile_discord          :string
#  level_number             :integer
#  level_potencial          :string
#  level_testimony          :string
#  class_progress           :integer
#  meeting_situation        :string
#  meeting_last             :date
#  meeting_next             :date
#  meeting_number           :integer
#  meeting_link             :string
#  github_link              :string
#  github_intensity         :string
#  wakatime_link            :string
#  wakatime_time            :integer
#  wakatime_intensity       :string
#  linkedin_link            :string
#  linkedin_followers       :integer
#  linkedin_post_last_month :integer
#  linkedin_intensity       :string
#  challenge                :integer
#  mission_future           :string
#  mission_future_point     :integer
#  mission_base             :string
#  mission_base_point       :integer
#  mission_vacancy          :string
#  mission_vacancy_point    :integer
#  mission_startup          :string
#  mission_startup_point    :integer
#  user_id                  :bigint           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Student < ApplicationRecord
  belongs_to :user

  enum level_potencial: { low: "low", medium: "medium", high: "high", give_up: "give_up", not_started: "not_started", no_testimony: "no_testimony", succeed: "succeed" }, _suffix: true
  enum level_testimony: { good: "good", excellent: "excellent", almost_goal: "almost_goal", goal: "goal" }
  enum meeting_situation: { bought: "bought", won: "won", not_bought: "not_bought" }
  enum github_intensity: { not_found: "not_found", very_weak: "very_weak", weak: "weak", medium: "medium", strong: "strong", very_strong: "very_strong" }, _prefix: :github
  enum wakatime_intensity: { not_found: "not_found", very_weak: "very_weak", weak: "weak", medium: "medium", strong: "strong", very_strong: "very_strong" }, _prefix: :wakatime
  enum linkedin_intensity: { not_found: "not_found", very_weak: "very_weak", weak: "weak", medium: "medium", strong: "strong", very_strong: "very_strong" }, _prefix: :linkedin
  enum challenge: { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, }
  enum knowledge: { m0: 0, m3: 3, m6: 6, a1: 12, a2: 24, a5: 60, a10: 120 }

  before_save :before_save

  def before_save
    Levels::Number.call({ resource: self })
  end

end
