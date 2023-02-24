module Intensity
  class Linkedin < BusinessApplication

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      linkedin_link_present = @student.linkedin_link.to_s.include? "linkedin.com"

      unless linkedin_link_present
        linkedin_intensity = "not_found"
      end

      @student.linkedin_intensity = linkedin_intensity
    end

  end
end