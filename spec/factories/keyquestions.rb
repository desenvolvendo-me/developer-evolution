# == Schema Information
#
# Table name: keyquestions
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  purpose_id :bigint           not null
#
# Indexes
#
#  index_keyquestions_on_purpose_id  (purpose_id)
#
# Foreign Keys
#
#  fk_rails_...  (purpose_id => purposes.id)
#
FactoryBot.define do
  factory :keyquestion do
    title { "MyString" }
    purpose { nil }
  end
end
