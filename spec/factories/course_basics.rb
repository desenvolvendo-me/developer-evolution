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
#  number_of_course          :string
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
    link_course { "https://app.gather.town/app/jrYpWiRFORFSJlD8/DesenvolvendoMe" }
    link_repository { "https://chat.openai.com/c/b17f7f1e-99af-4013-b991-87a787d5d729" }
    link_certified { "https://github.com/desenvolvendo-me/developer-evolution/commit/" }
    avaliation_course { "5" }
    avaliation_apprenticeship { "2" }
    course { nil }
  end
end
