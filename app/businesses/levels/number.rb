module Levels
  class Number < BusinessApplication

    def initialize(**params)
      @params = params
    end

    def call
      level_number = Student.challenges[@params[:resource].challenge]

      @params[:resource].level_number = level_number
    end

  end
end