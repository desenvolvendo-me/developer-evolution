# == Schema Information
#
# Table name: script_questions
#
#  id          :bigint           not null, primary key
#  category    :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  script_id   :bigint           not null
#
# Indexes
#
#  index_script_questions_on_script_id  (script_id)
#
# Foreign Keys
#
#  fk_rails_...  (script_id => scripts.id)
#
class ScriptQuestion < ApplicationRecord
  belongs_to :script

  QUESTIONS = [
    "O que aconteceu?",
    "Quando aconteceu?",
    "Onde aconteceu?",
    "Quem estava no momento?",
    "Os seus sentimentos no momento?",
    "O seu pensamento no momento?"
  ]
end
