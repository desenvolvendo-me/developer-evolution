module Profiles
  module Potentials
    class NotStarted < BusinessApplication
      def initialize(**params)
        @params = params
        @student = @params[:resource]
      end

      def call
        return unless @params[:level_potential].eql?("undefined")
        return unless @student.class_progress < 10 or @student.github_link.blank? or @student.wakatime_link.blank?

        level_potential = "not_started"

        @student.level_potential = level_potential
      end
    end
  end
end


