# == Schema Information
#
# Table name: thoughts
#
#  id           :bigint           not null, primary key
#  description  :text
#  level        :string
#  type_thought :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_thoughts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :thought do
    sequence(:email) { |n| "#{n}#{Faker::Internet.unique.email}" }
    level { "1" }
    type_thought { "negativo" }
    description { "Não aproveitar as oportunidades de tirar dúvida na mentoria" }
    association :student, factory: :student
  end
end
