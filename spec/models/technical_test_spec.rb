# == Schema Information
#
# Table name: technical_tests
#
#  id           :bigint           not null, primary key
#  battle       :integer
#  link         :string
#  project      :string
#  readme       :text
#  release_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_technical_tests_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'
RSpec.describe Preparation, type: :model do

  describe 'validations' do
    let(:student) { FactoryBot.create(:student) }

    describe 'associations' do
      it { should belong_to(:student) }
      it { should validate_inclusion_of(:battle).in_range(1..5) }
      it { should validate_presence_of(:project) }
      it { should validate_presence_of(:readme) }
      it { should validate_presence_of(:link) }
      it { should validate_inclusion_of(:release_type).in_array(TechnicalTest::CATEGORY) }
    end
  end
end
