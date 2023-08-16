class Preparation < ApplicationRecord
  belongs_to :student
  has_many :preparations_releases, dependent: :destroy
end
