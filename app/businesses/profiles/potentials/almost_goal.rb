module Profiles
  module Potentials
    class AlmostGoal < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.type_career.eql?("technology") and @student.salary < 5000 and @student.class_progress >= 33

        level_potential = "almost_goal"

        @student.level_potential = level_potential
      end
    end
  end
end


