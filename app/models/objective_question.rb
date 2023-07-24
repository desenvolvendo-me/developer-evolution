# == Schema Information
#
# Table name: objective_questions
#
#  id            :bigint           not null, primary key
#  answer        :string
#  description   :string
#  type_question :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  objective_id  :bigint           not null
#
# Indexes
#
#  index_objective_questions_on_objective_id  (objective_id)
#
# Foreign Keys
#
#  fk_rails_...  (objective_id => objectives.id)
#
class ObjectiveQuestion < ApplicationRecord
  belongs_to :objective

  TYPE_QUESTION = %w[Detalhe Métrica Tempo]
  DESCRIPTION = ["O que eu desejo alcançar?",
                   "Por que esse objetivo é importante?",
                   "Quem são os envolvidos?",
                   "Quais são os recursos necessários?",
                   "Quais são os resultados esperados, em termos quantitativos?",
                   "Como vou saber se foi alcançado?",
                   "Quais métricas podem ser usadas para acompanhar os resultados?",
                   "Qual é o prazo máximo para atigir?",
                   "Qual é o prazo mínimo para atigir?"]

end
