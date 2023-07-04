FactoryBot.define do
  factory :experience do
    student { nil }
    content { "MyText" }
    category { "MyString" }
    level { 1 }
    week { 1 }
  end
end
