# == Schema Information
#
# Table name: routines
#
#  id              :bigint           not null, primary key
#  activity        :string
#  day_of_the_week :integer
#  hour            :time
#  priority        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint           not null
#
# Indexes
#
#  index_routines_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Routine < ApplicationRecord
  belongs_to :student
  enum day_of_the_week: [ "domingo",  "segunda", "terça", "quarta", "quinta", "sexta", "sábado" ]
  validates :activity, :priority, presence: true

  #Estou com dúvida se é realmente necessário essas linhas abaixo:
  def self.weekly_activities
    [
      { day_of_th_week: 1, time: '08:00', activity: 'Study', priority: 'high'},
      { day_of_the_week: 2, time: '10:00', activity: 'work', priority: 'medium'}
    ]
  end
end
