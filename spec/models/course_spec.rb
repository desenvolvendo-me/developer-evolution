# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  type_course :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint           not null
#
# Indexes
#
#  index_courses_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Course, type: :model do
  context "associations" do
    it { should belong_to(:student) }
  end
end
