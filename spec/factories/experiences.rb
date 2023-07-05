# == Schema Information
#
# Table name: experiences
#
#  id         :bigint           not null, primary key
#  category   :string
#  content    :text
#  level      :integer
#  week       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_experiences_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :experience do
    association :student
    content { Faker::Lorem.paragraph }
    category { %w[Medo Dificuldade Aprendizado Insight Feedback].sample }
    week { rand(1..4) }
    level { rand(1..8) }
  end
end
