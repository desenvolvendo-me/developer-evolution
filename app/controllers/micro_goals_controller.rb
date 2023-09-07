class MicroGoalsController < ApplicationController

  before_action :set_micro_goal, only: [:show, :edit, :update, :destroy]

  def index
    @micro_goals = current_user.student.micro_goals.all
  end

  def new
    @micro_goal = current_user.student.micro_goals.new
  end

  def create
    @micro_goal = current_user.student.micro_goals.build(micro_goal_params)

    if @micro_goal.save
      flash[:notice] = t('controller.micro_goals.flash_create')
      redirect_to action: :show, id: @micro_goal.id
    else
      flash[:alert] = @micro_goal.errors.full_messages.join('. ')
      render :new
    end
  end

  def show;end

  def update
    if @micro_goal.update(micro_goal_params)
      flash[:notice] = t('controller.micro_goals.flash_update')
      redirect_to action: :show, id: @micro_goal.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @micro_goal.destroy
    flash[:notice] = t('controller.micro_goals.flash_destroy')
    redirect_to micro_goals_path
  end

  private

  def set_micro_goal
    @micro_goal = current_user.student.micro_goals.find(params[:id])
  end

  def micro_goal_params
    params.require(:micro_goal).permit(:student_id, :micro_goal)
  end
end