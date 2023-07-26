# == Schema Information
#
# Table name: technical_tests
#
#  id           :bigint           not null, primary key
#  battle       :integer
#  link         :string
#  name         :string
#  project      :string
#  readme       :text
#  release_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_technical_tests_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :technical_test do
    project { "https://github.com/user/repo" }
    readme { "https://github.com/user/repo/readme" }
    link { "https://github.com/user/repo/milestones/1" }
    battle { rand(1..5) }
    release_type { "TechnicalTest::CATEGORY.sample" }
    student { "Gustavo Ramos" }
  end
end
