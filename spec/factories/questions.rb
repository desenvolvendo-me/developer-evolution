# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  keyquestion_id :bigint           not null
#
# Indexes
#
#  index_questions_on_keyquestion_id  (keyquestion_id)
#
# Foreign Keys
#
#  fk_rails_...  (keyquestion_id => keyquestions.id)
#
FactoryBot.define do
  factory :question do
    tittle { "MyString" }
    keyquestion { nil }
  end
end
