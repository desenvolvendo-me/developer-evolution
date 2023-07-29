# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  version    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_purposes_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :purpose do
    version { 1 }
    time { 1 }
    type_question { "Why?" }
    question { "Why programming" }
    answer { "programming is good" }
    association :student
  end
end
