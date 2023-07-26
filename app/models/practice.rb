# == Schema Information
#
# Table name: practices
#
#  id             :bigint           not null, primary key
#  activity_date  :date
#  activity_total :integer
#  commit_date    :date
#  commit_status  :string
#  commit_total   :integer
#  time_available :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  student_id     :bigint           not null
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
