# == Schema Information
#
# Table name: routines
#
#  id              :bigint           not null, primary key
#  activity        :string
#  day_of_the_week :integer
#  hour            :time
#  priority        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint           not null
#
# Indexes
#
#  index_routines_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Routine, type: :model do
  describe 'associations' do
    it { should belong_to(:student) }
  end
end