FactoryBot.define do
  factory :preparations_release do
    milestone_release_link { "MyString" }
    pull_request_release_link { "MyString" }
    preparation { nil }
  end
end
