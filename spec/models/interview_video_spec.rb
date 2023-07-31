# == Schema Information
#
# Table name: interview_videos
#
#  id           :bigint           not null, primary key
#  video_link   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  interview_id :bigint           not null
#
# Indexes
#
#  index_interview_videos_on_interview_id  (interview_id)
#
# Foreign Keys
#
#  fk_rails_...  (interview_id => interviews.id)
#
require 'rails_helper'

RSpec.describe InterviewVideo, type: :model do
  describe "associations" do
    it { should belong_to(:interview) }
  end
end
