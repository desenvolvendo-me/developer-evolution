class MicroGoals::MicroGoalTasksController < ApplicationController
  before_action :set_micro_goal
  before_action :set_micro_goal_task, only: [:show, :edit, :update, :destroy]

  def index
    @micro_goal_tasks = MicroGoalTask.all
  end

  def new
    @micro_goal_task = @micro_goal.micro_goal_tasks.build
  end

  def create
    @micro_goal_task = @micro_goal.micro_goal_tasks.build(micro_goal_task_params)

    if @micro_goal_task.save
      redirect_to micro_goal_micro_goal_tasks_path(@micro_goal), notice: t('controller.micro_goal_tasks.flash_create')
    else
      flash[:alert] = @micro_goal_task.errors.full_messages.join('. ')
      render :new
    end
  end

  def show;end

  def edit;end

  def update
    if @micro_goal_task.update(micro_goal_task_params)
      redirect_to micro_goal_micro_goal_task_path(@micro_goal), notice: t('controller.micro_goal_tasks.flash_update')
    else
      render :edit
    end
  end

  def destroy
    @micro_goal_task.destroy
    redirect_to micro_goal_micro_goal_tasks_path(@micro_goal), notice: t('controller.micro_goal_tasks.flash_destroy')
  end

  private

  def set_micro_goal
    @micro_goal = MicroGoal.find(params[:micro_goal_id])
  end

  def micro_goal_task_params
    params.require(:micro_goal_task).permit(:task, :start_date, :end_date, :percentage, :micro_goal_id)
  end

  def set_micro_goal_task
    @micro_goal_task = MicroGoalTask.find(params[:id])
  end
end