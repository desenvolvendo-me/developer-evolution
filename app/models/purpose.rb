# == Schema Information
#
# Table name: purposes
#
#  id            :bigint           not null, primary key
#  answer        :text
#  question      :text
#  time          :integer
#  type_question :string
#  version       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  student_id    :bigint
#
# Indexes
#
#  index_purposes_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Purpose < ApplicationRecord
  belongs_to :student

  def self.type_question
    ["Porque?", "Por quem?", "Como?", "Quando?"]
  end

  def self.question
    ["Por que quer estudar programação?",
     "Por que vai sacrificar horas de lazer?",
     "Por que vai sacrificar horas com a família?",
     "Por que isso é importante para você?",
     "Quem são as pessoas que vai compartilhar seus resultados?",
     "O que quer fazer por elas quando tiver resultados?",
     "O que vão sentir quando fizer tudo que quer fazer por elas?",
     "Em quanto tempo quer a primeira ou próxima vaga programação?",
     "Em quanto tempo acredita que vai pode fazer o que quer pelas pessoas?",
     "Em quanto tempo acredita que vai chegar no excelente salários?",
     "Em quanto tempo vai aprender a linguagem de programação verdadeiramente?",
     "Em quanto tempo vai aprender a framework verdadeiramente?",
     "Como vai fazer para ter resultado?",
     "O que vai estudar para ter um excelente salário?",
     "Como vai se organizar sua vida para construir o quer para as pessoas?",
     "Quanto tempo vai dedicar para isso por dia?",
     "O que vai abrir mão para construir isso?"]
  end
  # validates :version, :time, :type_question, :question, :answer, presence: true
end
