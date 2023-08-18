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
FactoryBot.define do
  factory :objective_question do
    objective { nil }
    type_question { "Detalhe" }
    description { "Quais são os recursos necessários?" }
    answer { "Saber habilidades técnicas e comportamentais" }
  end
end
