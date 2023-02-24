module Profiles
  module Potentials
    class High < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.type_career.eql?("not_technology")

        wakatime_intensity_status = ["strong", "very_strong"]

        return unless wakatime_intensity_status.include? @student.wakatime_intensity
        level_potential = "high"

        @student.level_potential = level_potential
      end
    end
  end
end


