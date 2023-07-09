# == Schema Information
#
# Table name: preparations
#
#  id           :bigint           not null, primary key
#  link         :string
#  name         :string
#  project      :string
#  readme       :text
#  release      :integer
#  release_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :preparation do
    name { "MyString" }
    project { "MyString" }
    readme { "MyText" }
    link { "MyString" }
    release { 1 }
    release_type { "MyString" }
  end
end
