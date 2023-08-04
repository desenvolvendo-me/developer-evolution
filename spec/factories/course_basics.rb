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
    link_course { "https://www.youtube.com/watch?v=bLDH3NypOVo&list=PLnV7i1DUV_zOit4a_tEDf1_PcRd25dL7e" }
    link_repository { "https://github.com/desenvolvendo-me/linguagem_2021_ruby_ideal" }
    link_certified { nil }
    avaliation_course { "5" }
    avaliation_apprenticeship { "2" }
  end
end
