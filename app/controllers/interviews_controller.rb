class InterviewsController < InheritedResources::Base

  private

    def interview_params
      params.require(:interview).permit(:interview_type, :video_number, :answer)
    end

end
