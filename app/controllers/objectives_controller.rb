class ObjectivesController < InheritedResources::Base
  before_action :set_objective, only: %i[ show edit update destroy ]
  def index
    @objectives = current_user.student.objectives.all
  end
  def show
  end
  def new
    @objective = current_user.student.objectives.new
  end

  def show
    @objective = current_user.student.objectives.find(params[:id])
  end

  def create
    @objective = current_user.student.objectives.new(objective_params)

    if @objective.save
      redirect_to objective_url(@objective), notice: I18n.t('objective.controller.notice_create')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  def update

    if @objective.update(objective_params)
      redirect_to objective_url(@objective), notice: I18n.t('objective.controller.notice_update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @objective = current_user.student.objectives.find(params[:id])
    @objective.destroy

    redirect_to objectives_path, notice: I18n.t('objective.controller.destroy')
  end

  private

  def set_objective
    @objective = current_user.student.objectives.find(params[:id])
  end

  def objective_params
    params.require(:objective).permit(:title)
  end

end
