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

  QUESTIONS = {
    "O que aconteceu?" => 1,
    "Quando aconteceu?" => 2,
    "Onde aconteceu?" => 3,
    "Quem estava no momento?" => 4,
    "Os seus sentimentos no momento?" => 5,
    "O seu pensamento no momento?" => 6
  }
end
