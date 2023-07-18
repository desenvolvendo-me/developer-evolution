# == Schema Information
#
# Table name: thoughts
#
#  id         :bigint           not null, primary key
#  level      :integer
#  negative   :string
#  positive   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint
#
# Indexes
#
#  index_thoughts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Thought, type: :model do
  describe 'validations' do
    let(:student) { FactoryBot.create(:student) }

    it "is valid with valid attributes" do
      thought = FactoryBot.create(:thought, student: student)
      expect(thought).to be_valid
    end

    it "belongs to a student" do
      user = User.create!(email: "alice@example.com", password: "password")
      student = Student.create(name: "Alice", user: user)
      student.save!
      thought = student.thoughts.create!(positive: "logic programming", level: 1, negative: "Fear of getting stuck in an activity")
      expect(thought.student).to eq(student)
    end
  end
end
