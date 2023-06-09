# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
FactoryBot.define do
  factory :answer do
    tittle { "MyString" }
    question { nil }
  end
end
