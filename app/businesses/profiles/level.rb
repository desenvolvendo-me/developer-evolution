module Profiles
  class Level < BusinessApplication
    NOTE_LEVEL_UP = 7

    def initialize(**params)
      @params = params
    end

    def call
      level_number = count_level_challenges

      level_number = count_level_missions(level_number)

      @params[:resource].level_number = level_number
    end

    private

    def count_level_missions(level_number)
      level_number += 1 if @params[:resource].mission_future.present? and @params[:resource].mission_future_point >= NOTE_LEVEL_UP
      level_number += 1 if @params[:resource].mission_base.present? and @params[:resource].mission_base_point >= NOTE_LEVEL_UP
      level_number += 1 if @params[:resource].mission_vacancy.present? and @params[:resource].mission_vacancy_point >= NOTE_LEVEL_UP
      level_number += 1 if @params[:resource].mission_startup.present? and @params[:resource].mission_startup_point >= NOTE_LEVEL_UP
      level_number
    end

    def count_level_challenges
      Student.challenges[@params[:resource].challenge].to_i
    end

  end
end