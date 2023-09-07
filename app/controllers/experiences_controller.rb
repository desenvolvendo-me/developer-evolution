class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :edit , :destroy]
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
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @experience.update(experience_params)
      flash[:notice] = I18n.t('experience.controller.flash_update')
      redirect_to action: :show, id: @experience.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @experience.destroy

    redirect_to experiences_url, notice: I18n.t('experience.controller.flash_delete')
  end
  private

  def experience_params
    params.require(:experience).permit(:content, :category, :level, :week)
  end

  def set_experience
    @experience = current_user.student.experiences.find_by(id: params[:id])
  end

end
