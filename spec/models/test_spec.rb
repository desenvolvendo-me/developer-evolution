# == Schema Information
#
# Table name: tests
#
#  id              :bigint           not null, primary key
#  project_link    :string
#  readme_link     :string
#  repository_link :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint
#
# Indexes
#
#  index_tests_on_student_id  (student_id)
#

require 'rails_helper'

RSpec.describe Test, type: :model do
  subject { build(:test) }

  # Testar as associações
  it { should belong_to(:student) }
  it { should have_many(:tests_battles).dependent(:destroy) }
end