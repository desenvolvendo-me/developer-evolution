# == Schema Information
#
# Table name: goal_questions
#
#  id            :bigint           not null, primary key
#  answer        :string
#  description   :string
#  type_question :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  goal_id       :bigint           not null
#
# Indexes
#
#  index_goal_questions_on_goal_id  (goal_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#
require 'rails_helper'

RSpec.describe GoalQuestion, type: :model do
  context "associations" do
    it { should belong_to(:goal) }
  end
end
