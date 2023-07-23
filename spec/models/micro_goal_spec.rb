# == Schema Information
#
# Table name: micro_goals
#
#  id         :bigint           not null, primary key
#  micro_goal :string
#  string     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe MicroGoal, type: :model do
  describe 'validations' do
    let(:student) { FactoryBot.create(:student) }

    it "is valid with valid attributes" do
      micro_goal = FactoryBot.create(:micro_goal, student: student)
      expect(micro_goal).to be_valid
    end

    it "is invalid without a micro_goal attribute" do
      micro_goal = MicroGoal.new(micro_goal: nil)
      expect(micro_goal).not_to be_valid
    end

    it "belongs to a student" do
      user = User.create!(email:"alice@example.com", password: "password")
      student = Student.create(name: "Alice", user: user)
      student.save!
      micro_goal = student.micro_goals.create!(micro_goal: "logic programming")
      expect(micro_goal.student).to eq(student)
    end

    it "has many tasks" do
      micro_goal = FactoryBot.create(:micro_goal, student: student)
      task1 = FactoryBot.create(:task, micro_goal: micro_goal)
      task2 = FactoryBot.create(:task, micro_goal: micro_goal)

      expect(micro_goal.tasks).to include(task1, task2)
    end
  end
end
