module Intensity
  class Github < BusinessApplication

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      unless @student.github_link.to_s.include? "github.com"
        github_intensity = "not_found"
      end

      @student.github_intensity = github_intensity
    end

  end
end