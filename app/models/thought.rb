# == Schema Information
#
# Table name: thoughts
#
#  id           :bigint           not null, primary key
#  description  :text
#  level        :string
#  type_thought :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :bigint           not null
#
# Indexes
#
#  index_thoughts_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Thought < ApplicationRecord

  belongs_to :student

  LEVEL_OPTIONS = %w[1 2 3].freeze
  enum level: Hash[LEVEL_OPTIONS.map { |option| [option, option] }]
  enum type_thought: {positive: "positive", negative: "negative"}
end
