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

  validates :content, presence: true
  validates :category, inclusion: { in: ['Medo', 'Dificuldade', 'Aprendizado', 'Insight', 'Feedback'] }
  validates :level, inclusion: { in: 1..8 }
  validates :week, inclusion: { in: 1..4 }, if: :level_previously_changed?
  validate :validate_category_week_level_combination

  private

  def validate_category_week_level_combination
    existing_experience = Experience.find_by(category: category, week: week, level: level)

    if existing_experience && (new_record? || existing_experience != self)
      errors.add(:base, "Já existe uma experiência com a mesma categoria, semana e nível")
    end
  end
end
