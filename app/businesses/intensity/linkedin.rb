module Intensity
  class Linkedin < BusinessApplication

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      linkedin_link_present = @student.linkedin_link.to_s.include? "linkedin.com"

      linkedin_followers_per_day = @student.linkedin_followers.to_i / (Date.today.mjd - @student.enrollment_date.mjd)

      unless linkedin_link_present
        linkedin_intensity = "not_found"
      end

      if linkedin_followers_per_day >= 2 and @student.linkedin_post_last_month >= 4 and linkedin_link_present
        linkedin_intensity = "very_weak"
      end

      if linkedin_followers_per_day >= 4 and @student.linkedin_post_last_month >= 8 and linkedin_link_present
        linkedin_intensity = "weak"
      end

      if linkedin_followers_per_day >= 6 and @student.linkedin_post_last_month >= 12 and linkedin_link_present
        linkedin_intensity = "medium"
      end

      if linkedin_followers_per_day >= 8 and @student.linkedin_post_last_month >= 14 and linkedin_link_present
        linkedin_intensity = "strong"
      end

      if linkedin_followers_per_day >= 10 and @student.linkedin_post_last_month >= 20 and linkedin_link_present
        linkedin_intensity = "very_strong"
      end

      @student.linkedin_intensity = linkedin_intensity
    end

  end
end