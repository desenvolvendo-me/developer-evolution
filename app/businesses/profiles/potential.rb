module Profiles
  class Potential < BusinessApplication
    NOTE_LEVEL_UP = 7

    def initialize(**params)
      @params = params
    end

    def call
      if @params[:resource].type_career.eql?("technology") and @params[:resource].salary >= 5000
        level_potencial = "no_testimony"
      end

      if @params[:resource].type_career.eql?("technology") and @params[:resource].salary < 5000 and @params[:resource].class_progress >= 33
        level_potencial = "almost_goal"
      end

      if @params[:resource].type_career.eql?("not_technology") and @params[:resource].salary >= 5000 and @params[:resource].class_progress >= 50
        level_potencial = "goal"
      end

      if @params[:resource].class_progress < 15
        level_potencial = "not_started"
      end

      @params[:resource].level_potencial = level_potencial
    end

  end
end