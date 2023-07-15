# == Schema Information
#
# Table name: preparations
#
#  id           :bigint           not null, primary key
#  link         :string
#  name         :string
#  project      :string
#  readme       :text
#  release      :integer
#  release_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
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
    name { "Banco Imobiliario" }
    project { "https://github.com/user/repo" }
    readme { "https://github.com/user/repo/readme" }
    link { "https://github.com/user/repo/milestones/1" }
    release { rand(1..5) }
    release_type {  Preparation::CATEGORY.sample }
  end
end
