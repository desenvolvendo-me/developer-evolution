FactoryBot.define do
  factory :objective do
    title { "MyString" }
    reason { "MyText" }
    people_involved { "MyText" }
    resources { "MyText" }
    expected_results { "MyText" }
    achieved { "MyText" }
    metrics { "MyText" }
    max_deadline { "2023-07-14" }
    min_deadline { "2023-07-14" }
    student { nil }
  end
end
