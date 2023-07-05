# == Schema Information
#
# Table name: experiences
#
#  id         :bigint           not null, primary key
#  category   :string
#  content    :text
#  level      :integer
#  week       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_experiences_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Experience, type: :model do
  describe 'validations' do
    let(:student) { FactoryBot.create(:student) }

    it 'is valid with valid attributes' do
      experience = FactoryBot.create(:experience, student: student)
      expect(experience).to be_valid
    end

  end
end
