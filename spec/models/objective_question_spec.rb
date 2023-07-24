# == Schema Information
#
# Table name: objective_questions
#
#  id            :bigint           not null, primary key
#  answer        :string
#  description   :string
#  type_question :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  objective_id  :bigint           not null
#
# Indexes
#
#  index_objective_questions_on_objective_id  (objective_id)
#
# Foreign Keys
#
#  fk_rails_...  (objective_id => objectives.id)
#
require 'rails_helper'

RSpec.describe ObjectiveQuestion, type: :model do
  context "associations" do
    it { should belong_to(:objective) }
  end
end
