module Profiles
  module Potentials
    class Low < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.type_career.eql?("not_technology")

        wakatime_intensity_status = ["not_found", "very_weak"]
        wakatime_intensity_not_acceptable =  wakatime_intensity_status.include? @student.wakatime_intensity

        if wakatime_intensity_not_acceptable
          level_potential = "low"
        end

        @student.level_potential = level_potential
      end
    end
  end
end


