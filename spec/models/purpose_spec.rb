# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  period     :string(20)
#  version    :string(5)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           not null
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
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:student) { Student.create(name: 'John Doe') }

  it "é válido com um período e versão" do
    purpose = Purpose.new(period: "2023", version: "1.0", student: student)
    expect(purpose).to be_valid
  end

  it "não é válido sem um período" do
    purpose = Purpose.new(version: "1.0")
    expect(purpose).to_not be_valid
  end

  it "não é válido sem uma versão" do
    purpose = Purpose.new(period: "2023")
    expect(purpose).to_not be_valid
  end
end
