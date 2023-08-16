# == Schema Information
#
# Table name: preparations
#
#  id              :bigint           not null, primary key
#  name            :string
#  project_link    :string
#  readme_link     :string
#  repository_link :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint           not null
#
# Indexes
#
#  index_preparations_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Preparation, type: :model do
  subject { build(:preparation) }

  # Testar as associações
  it { should belong_to(:student) }
  it { should have_many(:preparations_releases).dependent(:destroy) }
end
