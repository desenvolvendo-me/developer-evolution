# == Schema Information
#
# Table name: objectives
#
#  id          :bigint           not null, primary key
#  description :string
#  reason      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint           not null
#
# Indexes
#
#  index_objectives_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :objective do
    student { nil }
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    reason { Faker::Lorem.sentence }
  end
end
