# == Schema Information
#
# Table name: interviews
#
#  id             :bigint           not null, primary key
#  answer         :string
#  interview_type :string
#  video_number   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  student_id     :bigint           not null
#
# Indexes
#
#  index_interviews_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Interview < ApplicationRecord
  belongs_to :student
  INTERVIEW_TYPES = {
    "VIDA" => "Vida",
    "RESILIÊNCIA" => "Resiliência",
    "SUPERAÇÃO" => "Superação",
    "FOCO E DISCIPLINA" => "Foco e Disciplina",
    "EMPRESA" => "Empresa",
    "PORTFÓLIO" => "Portfólio"
  }
  VIDEO_NUMBERS = {
    1 => "1",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5"
  }
end
