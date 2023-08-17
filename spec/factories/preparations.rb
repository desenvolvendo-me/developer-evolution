# == Schema Information
#
# Table name: preparations
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
#  index_preparations_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :preparation do
    name { "Editora de Livro" }
    repository_link { "https://github.com/user/repo1" }
    project_link { "https://github.com/user/repo1/projects/1" }
    readme_link { "https://github.com/user/repo1/blob/main/README.md" }
  end
end
