class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :update, :edit, :destroy]
  def index
    @interviews = current_user.student.interviews
  end
  def new
    @interview = Interview.new
  end
  def create
    @interview = current_user.student.interviews.build(interview_params)

    if @interview.save
      flash[:notice] = I18n.t('interview.controller.flash_create')
      redirect_to action: :show, id: @interview.id
    else
      flash[:alert] = @interview.errors.full_messages.join('. ')
      redirect_to interviews_path
    end
  end

  def show

  end

  def edit
  end

  def update
    if @interview.update(interview_params)
      flash[:notice] = I18n.t('interview.controller.flash_update')
      redirect_to action: :show, id: @interview.id
    else
      redirect_to action: :edit
    end
  end
  private

  def interview_params
    params.require(:interview).permit(:interview_type, :answer)
  end

  def set_interview
    @interview = current_user.student.interviews.find(params[:id])
  end

end
