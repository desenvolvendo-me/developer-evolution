# == Schema Information
#
# Table name: objectives
#
#  id               :bigint           not null, primary key
#  achieved         :text
#  expected_results :text
#  max_deadline     :date
#  metrics          :text
#  min_deadline     :date
#  people_involved  :text
#  reason           :text
#  resources        :text
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  student_id       :bigint           not null
#
# Indexes
#
#  index_objectives_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Objective, type: :model do
  describe 'associations' do
    it { should belong_to(:student) }
  end
end
