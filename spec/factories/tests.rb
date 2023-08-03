# == Schema Information
#
# Table name: tests
#
#  id              :bigint           not null, primary key
#  project_link    :string
#  readme_link     :string
#  repository_link :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint
#
# Indexes
#
#  index_tests_on_student_id  (student_id)
#
FactoryBot.define do
  factory :test do
    repository_link { "MyString" }
    project_link { "MyString" }
    readme_link { "MyString" }
  end
end
