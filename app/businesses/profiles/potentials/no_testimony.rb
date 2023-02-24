module Profiles
  module Potentials
    class NoTestimony < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.type_career.eql?("technology") and @student.salary >= 5000

        level_potential = "no_testimony"

        @student.level_potential = level_potential
      end
    end
  end
end


