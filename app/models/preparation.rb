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
class Preparation < ApplicationRecord
  belongs_to :student

  CATEGORY = %w[ "Milestone Release",
                      "Pull Request Release",
                      "Pull Request Branch 1",
                      "Pull Request Branch 2",
                      "Pull Request Branch 3",
                      "Pull Request Branch 4",
                      "Pull Request Branch 5",
                      "Pull Request Branch 6",
                      "Pull Request Branch 7",
                      "Pull Request Branch 8",
                      "Issues 1",
                      "Issues 2",
                      "Issues 3",
                      "Issues 4",
                      "Issues 5",
                      "Issues 6",
                      "Issues 7",
                      "Issues 8"]

  validates :name, presence: true
  validates :project, presence: true
  validates :readme, presence: true
  validates :link, presence: true
  validates :release, inclusion: {in: 1..5}
  validates :release_type, inclusion: {in: CATEGORY}
end
