# == Schema Information
#
# Table name: keyquestions
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  purpose_id :bigint           not null
#
# Indexes
#
#  index_keyquestions_on_purpose_id  (purpose_id)
#
# Foreign Keys
#
#  fk_rails_...  (purpose_id => purposes.id)
#
require 'rails_helper'

RSpec.describe Keyquestion, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'é válido com um título' do
    purpose = Purpose.create(version: '1.0', period: '2023')
    keyquestion = Keyquestion.new(title: 'Porque', purpose: purpose)
    expect(keyquestion).to be_valid
  end

  it 'é inválido sem um título' do
    purpose = Purpose.create(version: '1.0', period: '2023')
    keyquestion = Keyquestion.new(purpose: purpose)
    expect(keyquestion).not_to be_valid
  end
end
