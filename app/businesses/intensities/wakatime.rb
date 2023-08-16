module Intensities
  class Wakatime < BusinessApplication

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      wakatime_link_present = @student.wakatime_link.to_s.include? "wakatime.com"

      unless wakatime_link_present
        wakatime_intensity = "not_found"
      end

      if @student.wakatime_activity_average.to_i >= 15 and wakatime_link_present
        wakatime_intensity = "very_weak"
      end

      if @student.wakatime_activity_average.to_i >= 60 and wakatime_link_present
        wakatime_intensity = "weak"
      end

      if @student.wakatime_activity_average.to_i >= 90 and wakatime_link_present
        wakatime_intensity = "medium"
      end

      if @student.wakatime_activity_average.to_i >= 180 and wakatime_link_present
        wakatime_intensity = "strong"
      end

      if @student.wakatime_activity_average.to_i > 181 and wakatime_link_present
        wakatime_intensity = "very_strong"
      end

      @student.wakatime_intensity = wakatime_intensity
    end

  end
end