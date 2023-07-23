class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @task.micro_goal_id = params[:micro_goal_id]
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Tarefa criada com sucesso.'
      redirect_to action: :show, id: @task.id
    else
      flash[:alert] = @task.errors.full_messages.join('. ')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Tarefa atualizada com sucesso.'
      redirect_to action: :show, id: @task.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Tarefa excluída com sucesso.'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:task, :start_date, :end_date, :percentage, :micro_goal_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end