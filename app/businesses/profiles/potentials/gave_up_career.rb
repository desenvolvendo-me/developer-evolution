module Profiles
  module Potentials
    class GaveUpCareer < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.class_progress >= 10 and @student.class_progress < 15 and @student.wakatime_time <= 15

        level_potential = "gave_up_career"

        @student.level_potential = level_potential
      end
    end
  end
end


