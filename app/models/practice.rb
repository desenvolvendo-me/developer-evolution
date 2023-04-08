# == Schema Information
#
# Table name: practices
#
#  id           :bigint           not null, primary key
#  commit_date  :date
#  commit_total :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_practices_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Practice < ApplicationRecord
  belongs_to :student
end