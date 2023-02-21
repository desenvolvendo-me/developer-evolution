# == Schema Information
#
# Table name: students
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  class_name               :string
#  enrollment_date          :date
#  knowledge                :string
#  profile_hotmart          :string
#  profile_discord          :string
#  level_number             :integer
#  level_potencial          :string
#  level_testimony          :string
#  class_progress           :integer
#  meeting_situation        :string
#  meeting_last             :date
#  meeting_next             :date
#  meeting_number           :integer
#  meeting_link             :string
#  github_link              :string
#  github_intensity         :string
#  wakatime_link            :string
#  wakatime_time            :integer
#  wakatime_intensity       :string
#  linkedin_link            :string
#  linkedin_followers       :integer
#  linkedin_post_last_month :integer
#  linkedin_intensity       :string
#  challenge                :integer
#  mission_future           :string
#  mission_future_point     :integer
#  mission_base             :string
#  mission_base_point       :integer
#  mission_vacancy          :string
#  mission_vacancy_point    :integer
#  mission_startup          :string
#  mission_startup_point    :integer
#  user_id                  :bigint           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
