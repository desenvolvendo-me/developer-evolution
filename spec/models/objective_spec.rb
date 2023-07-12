# == Schema Information
#
# Table name: objectives
#
#  id          :bigint           not null, primary key
#  description :string
#  reason      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  student_id  :bigint           not null
#
# Indexes
#
#  index_objectives_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Objective, type: :model do
  context "with students" do
    let(:student) { FactoryBot.create(:student) }

    describe "creation" do
      it "should create and save a new objective" do
        objective = FactoryBot.create(:objective, student: student)
        expect(objective).to be_valid
      end
    end

    describe "querying objectives by student" do
      it "should return all objectives for a specific student" do
        objective1 = FactoryBot.create(:objective, student: student)
        objective2 = FactoryBot.create(:objective, student: student)

        objectives = Objective.where(student: student)

        expect(objectives).to contain_exactly(objective1, objective2)
      end
    end

    describe "querying objectives by title" do
      it "should return objectives with a specific title" do
        title = "My Objective"

        objective1 = FactoryBot.create(:objective, title: title, student: student)
        objective2 = FactoryBot.create(:objective, student: student)

        objectives = Objective.where(title: title)

        expect(objectives).to contain_exactly(objective1)
      end
    end
  end
end
