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
#
require 'rails_helper'

RSpec.describe Preparation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
