# == Schema Information
#
# Table name: preparations
#
#  id           :bigint           not null, primary key
#  link         :string
#  name         :string
#  project      :string
#  readme       :text
#  release      :integer
#  release_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_preparations_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Preparation < ApplicationRecord
  belongs_to :student
end
