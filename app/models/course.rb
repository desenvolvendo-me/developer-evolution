# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  type_course :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint           not null
#
# Indexes
#
#  index_courses_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Course < ApplicationRecord
  belongs_to :student
  has_many :course_basics, dependent: :destroy

  TYPE_COURSES = ["Git/GitHub",
                  "Lógica de programação",
                  "Orientação a Objeto",
                  "Linguagem de programação",
                  "Frameworks",
                  "Banco de Dados"]
end
