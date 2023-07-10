# == Schema Information
#
# Table name: experiences
#
#  id         :bigint           not null, primary key
#  category   :string
#  content    :text
#  level      :integer
#  week       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_experiences_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Experience < ApplicationRecord
  belongs_to :student
  CATEGORY = %w[fear difficulty learning insight feedback]
  LEVEL_OPTIONS = [1, 2, 3, 4, 5, 6, 7, 8]
  WEEK_OPTIONS = [1, 2, 3, 4]

  validates :content, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :level, inclusion: { in: 1..8 }
  validates :week, inclusion: { in: 1..4 }
  validate :validate_category_week_level_combination

end
