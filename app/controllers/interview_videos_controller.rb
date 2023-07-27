class InterviewVideosController < InheritedResources::Base

  private

    def interview_video_params
      params.require(:interview_video).permit(:interview_id, :video_link)
    end

end
