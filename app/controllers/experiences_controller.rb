class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update]
  def index
    @experiences = current_user.student.experiences.all
  end
  def new
    @experience = Experience.new
  end
  def create
    @experience = current_user.student.experiences.build(experience_params)

    if @experience.save
      flash[:notice] = I18n.t('experience.controller.flash_create')
      redirect_to action: :show, id: @experience.id
    else
      flash[:alert] = @experience.errors.full_messages.join('. ')
      redirect_to experiences_path
    end
  end

  def show

  end

  def update
    if @experience.update(experience_params)
      flash[:notice] = I18n.t('experience.controller.flash_update')
      redirect_to action: :show, id: @experience.id
    else
      redirect_to action: :edit
    end
  end
  private

  def experience_params
    params.require(:experience).permit(:student_id, :content, :category, :level, :week)
  end

  def set_experience
    @experience = current_user.student.experiences.find(params[:id])
  end

end
