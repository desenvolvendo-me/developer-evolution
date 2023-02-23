module Intensity
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

      if @student.wakatime_time >= 15 and wakatime_link_present
        wakatime_intensity = "very_weak"
      end

      @student.wakatime_intensity = wakatime_intensity
    end

  end
end