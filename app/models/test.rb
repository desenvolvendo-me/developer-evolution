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
class Test < ApplicationRecord
  belongs_to :student
  has_many :tests_battles, dependent: :destroy
end
