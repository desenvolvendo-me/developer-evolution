class GoalsController < ApplicationController

  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = current_user.student.goals.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.student.goals.build(goal_params)

    if @goal.save
      flash[:notice] = t('goal.controller.successfully_created')
      redirect_to action: :show, id: @goal.id
    else
      flash[:alert] = @goal.errors.full_messages.join('. ')
      render :new
    end
  end

  def show;end

  def update
    if @goal.update(goal_params)
      flash[:notice] = t('goal.controller.successfully_updated')
      redirect_to action: :show, id: @goal.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, notice: t('goal.controller.successfully_destroyed')
  end

  private

  def set_goal
    @goal = current_user.student.goals.find(params[:id])
  end

    def goal_params
      params.require(:goal).permit(:description, :student_id, :form_type)
    end

end