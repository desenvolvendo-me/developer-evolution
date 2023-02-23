module Intensity
  class Github < BusinessApplication

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      github_link_present = @student.github_link.to_s.include? "github.com"

      unless github_link_present
        github_intensity = "not_found"
      end

      if @student.github_commit >= 1 and github_link_present
        github_intensity = "very_weak"
      end

      @student.github_intensity = github_intensity
    end

  end
end