module Profiles
  module Potentials
    class Goal < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.type_career.eql?("not_technology") and @student.salary >= 5000 and @student.class_progress >= 50

        level_potential = "goal"

        @student.level_potential = level_potential
      end
    end
  end
end


