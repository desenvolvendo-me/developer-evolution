module Profiles
  class Potential < BusinessApplication
    NOTE_LEVEL_UP = 7

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      Profiles::Level.call({ resource: @student })
      Intensity::Github.call({ resource: @student })
      Intensity::Wakatime.call({ resource: @student })
      Intensity::Linkedin.call({ resource: @student })

      if @student.type_career.eql?("not_technology")
        wakatime_intensity_status = ["not_found", "very_weak"]
        level_potencial = "low" if wakatime_intensity_status.include? @student.wakatime_intensity
      end

      if @student.type_career.eql?("not_technology")
        wakatime_intensity_status = ["weak", "medium"]
        level_potencial = "medium" if wakatime_intensity_status.include? @student.wakatime_intensity
      end

      if @student.class_progress < 10
        level_potencial = "not_started"
      end

      if @student.class_progress >= 10 and @student.class_progress < 15 and @student.wakatime_time <= 15
        level_potencial = "gave_up_career"
      end

      if @student.class_progress >= 10 and @student.class_progress < 15 and @student.wakatime_time > 15
        level_potencial = "gave_up_mentoring"
      end

      if @student.type_career.eql?("technology") and @student.salary < 5000 and @student.class_progress >= 33
        level_potencial = "almost_goal"
      end

      if @student.type_career.eql?("not_technology") and @student.salary >= 5000 and @student.class_progress >= 50
        level_potencial = "goal"
      end

      if @student.type_career.eql?("technology") and @student.salary >= 5000
        level_potencial = "no_testimony"
      end



      @student.level_potencial = level_potencial
    end

  end
end