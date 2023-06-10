# == Schema Information
#
# Table name: students
#
#  id                        :bigint           not null, primary key
#  challenge                 :integer
#  class_name                :string
#  class_progress            :integer
#  description_career        :string
#  enrollment_date           :date
#  github_commit             :integer
#  github_intensity          :string
#  github_link               :string
#  knowledge                 :string
#  level_number              :integer
#  level_potential           :string
#  level_testimony           :string
#  linkedin_followers        :integer
#  linkedin_intensity        :string
#  linkedin_link             :string
#  linkedin_post_last_month  :integer
#  meeting_last              :date
#  meeting_link              :string
#  meeting_next              :date
#  meeting_number            :integer
#  meeting_situation         :string
#  mission_base              :string
#  mission_base_generator    :string
#  mission_base_point        :integer
#  mission_future            :string
#  mission_future_generator  :string
#  mission_future_point      :integer
#  mission_startup           :string
#  mission_startup_generator :string
#  mission_startup_point     :integer
#  mission_vacancy           :string
#  mission_vacancy_generator :string
#  mission_vacancy_point     :integer
#  name                      :string
#  profile_discord           :string
#  profile_hotmart           :string
#  salary                    :float
#  type_career               :string
#  wakatime_intensity        :string
#  wakatime_link             :string
#  wakatime_time             :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id                   :bigint           not null
#
# Indexes
#
#  index_students_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
