module Levels
  class Number < BusinessApplication

    def initialize(**params)
      @params = params
    end

    def call
      Student.challenges[@params[:resourse].challenge]
    end

  end
end