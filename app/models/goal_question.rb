# == Schema Information
#
# Table name: goal_questions
#
#  id            :bigint           not null, primary key
#  answer        :string
#  description   :string
#  type_question :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  goal_id       :bigint           not null
#
# Indexes
#
#  index_goal_questions_on_goal_id  (goal_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#
class GoalQuestion < ApplicationRecord
  belongs_to :goal

  TYPE_QUESTION_OPTIONS = %w[Detalhe Métrica Tempo].freeze
  enum type_question: Hash[TYPE_QUESTION_OPTIONS.map { |option| [option, option] }]

  DESCRIPTION_OPTIONS = [
    'O que eu desejo alcançar?',
    'Por que essa meta é importante?',
    'Quem são os envolvidos?',
    'Quais são os recursos necessários?',
    'Quais são os resultados esperados, em termos quantitativos?',
    'Como vou saber se foi alcançada?',
    'Quais métricas podem ser usadas para acompanhar os resultados?',
    'Qual é o prazo máximo para atingir?',
    'Qual é o prazo mínimo para atingir?'
  ].freeze

  enum description: Hash[DESCRIPTION_OPTIONS.map { |option| [option, option] }]
end
