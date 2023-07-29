# == Schema Information
#
# Table name: scripts
#
#  id         :bigint           not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_scripts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Script < ApplicationRecord
  belongs_to :student
  has_many :script_questions, dependent: :destroy

  enum subject: {
    vida: "Vida",
    resiliencia: "Resiliência",
    superacao: "Superação",
    foco_e_disciplina: "Foco e Disciplina",
    empresa: "Empresa",
    portfolio: "Portfólio"
  }
end
