# == Schema Information
#
# Table name: interviews
#
#  id             :bigint           not null, primary key
#  interview_type :string
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
  has_many :interview_videos, dependent: :destroy
  INTERVIEW_TYPES = {
    "VIDA" => "Vida",
    "RESILIÊNCIA" => "Resiliência",
    "SUPERAÇÃO" => "Superação",
    "FOCO E DISCIPLINA" => "Foco e Disciplina",
    "EMPRESA" => "Empresa",
    "PORTFÓLIO" => "Portfólio"
  }
end
