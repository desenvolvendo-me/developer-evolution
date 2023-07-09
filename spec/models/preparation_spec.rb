# == Schema Information
#
# Table name: preparations
#
#  id           :bigint           not null, primary key
#  link         :string
#  name         :string
#  project      :string
#  readme       :text
#  release      :integer
#  release_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Preparation, type: :model do
  describe 'validations' do

    it 'is valid with valid attributes' do
      preparation = FactoryBot.create(:preparation)
      expect(preparation).to be_valid
    end

    it 'is valid without attribute project' do
      preparation = FactoryBot.create(:preparation, project: nil)
      expect(preparation).to be_valid
    end

  end
end