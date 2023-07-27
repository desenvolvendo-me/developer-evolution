# == Schema Information
#
# Table name: technical_tests
#
#  id           :bigint           not null, primary key
#  battle       :integer
#  link         :string
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
class TechnicalTest < ApplicationRecord
  belongs_to :student

  CATEGORY = ['Milestone Release', 'Pull Request Release', 'Pull Request Branch 1', 'Pull Request Branch 2', 'Pull Request Branch 3', 'Pull Request Branch 4', 'Pull Request Branch 5', 'Pull Request Branch 6', 'Pull Request Branch 7', 'Pull Request Branch 8', 'Issue 1', 'Issue 2', 'Issue 3', 'Issue 4', 'Issue 5', 'Issue 6', 'Issue 7', 'Issue 8']


end
