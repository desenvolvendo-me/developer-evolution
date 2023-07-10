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
  LEVEL_OPTIONS = {
    'level 1' => 1,
    'level 2' => 2,
    'level 3' => 3,
    'level 4' => 4,
    'level 5' => 5,
    'level 6' => 6,
    'level 7' => 7,
    'level 8' => 8
  }
  WEEK_OPTIONS = {
    'week 1' => 1,
    'week 2' => 2,
    'week 3' => 3,
    'week 4' => 4,
  }


  validates :content, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :level, inclusion: { in: LEVEL_OPTIONS.values }
  validates :week, inclusion: { in: WEEK_OPTIONS.values }
  validate :validate_category_week_level_combination

  private

  def validate_category_week_level_combination
    existing_experience = Experience.find_by(category: category, week: week, level: level)

    if existing_experience && (new_record? || existing_experience != self)
      errors.add(:base, "Já existe uma experiência com a mesma categoria, semana e nível")
    end
  end
end
