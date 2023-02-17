FactoryBot.define do
  factory :student do
    name { "MyString" }
    class_name { "MyString" }
    enrollment_date { "2023-02-17" }
    user { nil }
  end
end
