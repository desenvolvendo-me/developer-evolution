# == Schema Information
#
# Table name: course_basics
#
#  id                        :bigint           not null, primary key
#  avaliation_apprenticeship :string
#  avaliation_course         :string
#  link_certified            :string
#  link_course               :string
#  link_repository           :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  course_id                 :bigint           not null
#
# Indexes
#
#  index_course_basics_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
FactoryBot.define do
  factory :course_basic do
    link_course { "MyString" }
    link_repository { "MyString" }
    link_certified { "MyString" }
    avaliation_course { "MyString" }
    avaliation_apprenticeship { "MyString" }
    course { nil }
  end
end
