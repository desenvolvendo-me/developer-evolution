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
FactoryBot.define do
  factory :interview_video do
    interview { nil }
    video_link { "https://vimeo.com/190479606" }
  end
end
