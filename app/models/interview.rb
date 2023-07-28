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
  belongs_to :student
  has_many :interview_videos, dependent: :destroy
  enum interview_type: {
    vida: "Vida",
    resiliencia: "Resiliência",
    superacao: "Superação",
    foco_e_disciplina: "Foco e Disciplina",
    empresa: "Empresa",
    portfolio: "Portfólio"
  }
end
