# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  micro_goal :string
#  string     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_micro_goals_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe MicroGoal, type: :model do
  context "associations" do
    it { should belong_to(:student) }
  end
end
