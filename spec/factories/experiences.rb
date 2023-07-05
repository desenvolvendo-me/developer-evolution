FactoryBot.define do
  factory :experience do
    student { nil }
    content { "MyText" }
    category { "MyString" }
    level { 1 }
  end
end
