# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  version    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_purposes_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Purpose < ApplicationRecord
  belongs_to :student
  has_many :purpose_questions, dependent: :destroy
  # validates :version, :time, :type_question, :question, :answer, presence: true
end
