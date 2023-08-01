# == Schema Information
#
# Table name: purposes
#
#  id            :bigint           not null, primary key
#  answer        :text
#  question      :text
#  time          :integer
#  type_question :string
#  version       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  student_id    :bigint
#
# Indexes
#
#  index_purposes_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Purpose, type: :model do

  context 'Validar type question de purpose' do
    let(:student) { FactoryBot.create(:student) }

    it 'The Type Question field is valid' do
      purpose = FactoryBot.create(:purpose, student: student)
      expect(purpose).to be_valid
    end

    it 'The Type Question field is valid ' do
      PURPOSE = %w[Why How When Where]
      purpose = FactoryBot.create(:purpose, student: student, type_question: PURPOSE.sample)
      expect(purpose).to be_valid
    end

    # it 'The Type Question field is invalid ' do
    #   PURPOSE = FFaker::Lorem.word
    #   purpose = FactoryBot.create(:purpose, student: student, type_question: PURPOSE)
    #   expect(purpose).to_not be_valid
    # end
  end

  context 'Validar Question de purpose' do
    let(:student) { FactoryBot.create(:student) }

    it 'The Question field is valid' do
      purpose = FactoryBot.create(:purpose, student: student)
      expect(purpose).to be_valid
    end

    it 'The Question field is valid ' do
      PURPOSE = %w[because its good when Im on vacation]
      purpose = FactoryBot.create(:purpose, student: student, question: PURPOSE.sample)
      expect(purpose).to be_valid
    end
  end

  context 'Validar Answer de purpose' do
    let(:student) { FactoryBot.create(:student) }

    it 'The Answer field is valid' do
      purpose = FactoryBot.create(:purpose, student: student)
      expect(purpose).to be_valid
    end

    it 'The Answer field is valid ' do
      PURPOSE = %w[programming is good programming is life]
      purpose = FactoryBot.create(:purpose, student: student, answer: PURPOSE.sample)
      expect(purpose).to be_valid
    end
  end
end
