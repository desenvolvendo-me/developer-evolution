# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  micro_goal :string
#  percentage :float
#  start_date :date
#  task       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint
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
  describe 'associations' do
    it { should belong_to(:student) }
  end

  describe 'validations' do
    it { should validate_presence_of(:micro_goal) }
    it { should validate_presence_of(:task) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:percentage) }
  end
end
