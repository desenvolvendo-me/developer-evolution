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
  validates :category, inclusion: { in: ['Medo', 'Dificuldade', 'Aprendizado', 'Insight', 'Feedback'] }
  validates :level, inclusion: { in: 1..8 }
  validates :week, inclusion: { in: 1..4 }, if: :level_changed?

  def level_changed?
    level.present? && level_changed?
  end
end
