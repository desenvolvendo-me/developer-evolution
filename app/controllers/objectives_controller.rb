class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]

  def index
    @objectives = current_user.student.objectives.all
  end

  def new
    @objective = Objective.new
  end

  def create
    @objective = current_user.student.objectives.build(objective_params)

    if @objective.save
      redirect_to @objective
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @objective.update(objective_params)
      redirect_to @objective
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @objective.destroy

    redirect_to objectives_path, status: :see_other
  end

  private

  def set_objective
    @objective = current_user.student.objectives.find(params[:id])
  end

  def objective_params
    params.require(:objective).permit(:title, :reason, :people_involved, :resources, :expected_results, :achieved, :metrics, :max_deadline, :min_deadline)
  end
end
