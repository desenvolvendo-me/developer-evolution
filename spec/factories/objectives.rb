# == Schema Information
#
# Table name: objectives
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
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
    title { "OBJETIVO 1: Tornar-me um pogramador PHP/Laravel pleno" }
  end
end
