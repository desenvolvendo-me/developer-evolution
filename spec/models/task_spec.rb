require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    let(:user) { FactoryBot.create(:user) }
    let(:student) { FactoryBot.create(:student, user: user) }
    let(:micro_goal) { FactoryBot.create(:micro_goal, student: student) }

    it "is valid with valid attributes" do
      task = FactoryBot.create(:task, micro_goal: micro_goal)
      expect(task).to be_valid
    end

    it "is invalid without a task attribute" do
      task = Task.new(task: nil)
      expect(task).not_to be_valid
    end

    it "belongs to a micro_goal" do
      task = FactoryBot.create(:task, micro_goal: micro_goal)
      expect(task.micro_goal).to eq(micro_goal)
    end

    # it "has a start date" do
    #   task = FactoryBot.create(:task, micro_goal: micro_goal)
    #   expect(task.start_date).to be_present
    # end
    #
    # it "has an end date" do
    #   task = FactoryBot.create(:task, micro_goal: micro_goal)
    #   expect(task.end_date).to be_present
    # end
    #
    # it "has a percentage" do
    #   task = FactoryBot.create(:task, micro_goal: micro_goal)
    #   expect(task.percentage).to be_present
    # end
  end
end