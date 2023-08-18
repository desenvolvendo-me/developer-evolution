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

    describe 'associations' do
      it { should belong_to(:student) }
      it { should validate_presence_of(:content) }
      it { should validate_inclusion_of(:week).in_range(1..4) }
      it { should validate_inclusion_of(:level).in_range(1..8) }
      it { should validate_inclusion_of(:category).in_array(Experience::CATEGORY) }
    end

  end
end
