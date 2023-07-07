# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  micro_goal :string
#  percentage :float
#  start_date :date
#  task       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint
#
# Indexes
#
#  index_micro_goals_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :micro_goal do
    micro_goal { "MyString" }
    task { "MyString" }
    start_date { "2023-06-30" }
    end_date { "2023-06-30" }
    percentage { 1.5 }
    association :student
  end
end
