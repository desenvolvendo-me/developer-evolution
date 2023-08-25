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
#  student_id      :bigint
#
# Indexes
#
#  index_portfolios_on_student_id  (student_id)
#
FactoryBot.define do
  factory :portfolio do
    name { 'Hotelaria' }
    repository_link { "https://github.com/user/repo1" }
    project_link { "https://github.com/user/repo1/projects/1" }
    readme_link { "https://github.com/user/repo1/blob/main/README.md" }
  end
end
