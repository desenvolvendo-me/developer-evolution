# == Schema Information
#
# Table name: scripts
#
#  id         :bigint           not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :script do
    category { "MyString" }
  end
end
