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

end
