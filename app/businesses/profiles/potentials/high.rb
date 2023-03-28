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

        wakatime_power = ["strong", "very_strong"]

        wakatime_intensity_status = ["very_weak", "weak"]
        github_intensity_status = ["very_weak", "weak"]
        linkedin_intensity_status = ["very_weak"]

        return if wakatime_intensity_status.include? @student.wakatime_intensity and !wakatime_power.include? @student.wakatime_intensity
        return if github_intensity_status.include? @student.github_intensity and !wakatime_power.include? @student.wakatime_intensity
        return if linkedin_intensity_status.include? @student.linkedin_intensity and !wakatime_power.include? @student.wakatime_intensity

        level_potential = "high"

        @student.level_potential = level_potential
      end
    end
  end
end


