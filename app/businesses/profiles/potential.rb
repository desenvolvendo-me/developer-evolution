module Profiles
  class Potential < BusinessApplication
    NOTE_LEVEL_UP = 7

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      if @student.class_progress < 15
        level_potencial = "not_started"
      end

      if @student.class_progress >= 10 and @student.class_progress < 15 and @student.wakatime_time <= 15
        level_potencial = "gave_up_career"
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