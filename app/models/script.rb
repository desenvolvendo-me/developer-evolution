# == Schema Information
#
# Table name: scripts
#
#  id         :bigint           not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Script < ApplicationRecord
  has_many :script_questions, dependent: :destroy
end
