class PreparationsRelease < ApplicationRecord
  belongs_to :preparation
  has_many :preparations_issues, dependent: :destroy
end
