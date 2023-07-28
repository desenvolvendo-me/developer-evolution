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
FactoryBot.define do
  factory :script_question do
    description { "MyText" }
    category { "MyString" }
    script { nil }
  end
end
