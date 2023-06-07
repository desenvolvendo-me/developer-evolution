# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  tittle         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  keyquestion_id :bigint           not null
#
# Indexes
#
#  index_questions_on_keyquestion_id  (keyquestion_id)
#
# Foreign Keys
#
#  fk_rails_...  (keyquestion_id => keyquestions.id)
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:keyquestion) { Keyquestion.create(title: 'Porque') }

  it 'é válido com um título' do
    question = Question.new(tittle: 'Por que quer estudar programação?', keyquestion: keyquestion)
    expect(question).to be_valid
  end

  it 'é inválido sem um título' do
    question = Question.new(keyquestion: keyquestion)
    expect(question).not_to be_valid
  end
end
