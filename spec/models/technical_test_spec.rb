# == Schema Information
#
# Table name: technical_tests
#
#  id           :bigint           not null, primary key
#  battle       :integer
#  link         :string
#  name         :string
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

RSpec.describe TechnicalTest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
