# == Schema Information
#
# Table name: routines
#
#  id              :bigint           not null, primary key
#  activity        :string
#  day_of_the_week :integer
#  hour            :time
#  priority        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint           not null
#
# Indexes
#
#  index_routines_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :routine do
    day_of_the_week { 'domingo' }
    hour { "2023-06-09 16:25:19" }
    activity { "Almoço" }
    priority { "1" }
    student
  end
end