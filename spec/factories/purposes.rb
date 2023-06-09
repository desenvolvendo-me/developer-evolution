# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  period     :string(20)
#  version    :string(5)
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
    version { "MyString" }
    period { "MyString" }
    student { nil }
  end
end
