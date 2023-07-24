# == Schema Information
#
# Table name: objectives
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :objective do
    title { "OBJETIVO 1: Tornar-me um pogramador PHP/Laravel pleno" }
  end
end
