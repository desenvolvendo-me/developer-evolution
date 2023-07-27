class InterviewVideosController < InheritedResources::Base
  before_action :set_interview
  def index
    @interview_videos = @interview.interview_videos
  end

  def show
    @interview_video = @interview.interview_videos.find(params[:id])
  end

  def new
    @interview_video = @interview.interview_videos.new
  end

  def create
    @interview_video = @interview.interview_videos.build(interview_video_params)
    if @interview_video.save
      redirect_to interview_interview_video_url(@interview,@interview_video)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @interview_video = @interview.interview_videos.find(params[:id])
  end

  def update
    @interview_video = @interview.interview_videos.find(params[:id])
    if @interview_video.update(interview_video_params)
      redirect_to interview_interview_video_url(@interview,@interview_video), notice: 'Interview updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @interview_video = @interview.interview_videos.find(params[:id])
    @interview_video.destroy
    redirect_to interview_interview_videos_url, notice: 'Interview video destroyed'
  end
  private

  def set_interview
    @interview = Interview.find(params[:interview_id])
  end

    def interview_video_params
      params.require(:interview_video).permit(:video_link)
    end

end
