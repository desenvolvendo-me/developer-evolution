# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  let(:question) { Question.create(title: 'Por que quer estudar programação?') }

  it 'é válido com um título' do
    answer = Answer.new(title: 'Porque quando eu era pequena gostava muito de mexer em computador,', question: question)
    expect(answer).to be_valid
  end

  it 'é inválido sem um título' do
    answer = Answer.new(question: question)
    expect(answer).not_to be_valid
  end
end
