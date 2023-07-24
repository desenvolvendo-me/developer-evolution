# == Schema Information
#
# Table name: objectives
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Objective, type: :model do
  context "associations" do
    it { should have_many(:objective_questions) }
  end
end
