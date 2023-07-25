# == Schema Information
#
# Table name: objectives
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
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
  context "associations" do
    it { should belong_to(:student) }
    it { should have_many(:objective_questions) }
  end
end
