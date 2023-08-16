# == Schema Information
#
# Table name: portfolios
#
#  id              :bigint           not null, primary key
#  name            :string
#  project_link    :string
#  readme_link     :string
#  repository_link :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint           not null
#
# Indexes
#
#  index_portfolios_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :portfolio do
    name { "MyString" }
    repository_link { "MyString" }
    project_link { "MyString" }
    readme_link { "MyString" }
    student { nil }
  end
end
