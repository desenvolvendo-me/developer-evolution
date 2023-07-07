class MicroGoalsController < InheritedResources::Base

  before_action :set_micro_goal, only: [:show, :edit, :update]
  
  def index
   @micro_goals = current_user.student.micro_goals.all
  end

  def show

  end

  def new
    @micro_goal = MicroGoal.new
  end

  def create
    @micro_goal = MicroGoal.new(micro_goal_params)
    @micro_goal.student_id = params[:micro_goal][:student_id]

    if @micro_goal.save
      flash[:notice] = "micro_goal created successfully."
      redirect_to action: :show, id: @micro_goal.id
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @micro_goal.update(micro_goal_params)
      flash[:notice] = 'Micro-meta atualizada com sucesso.'
      redirect_to action: :show, id: @micro_goal.id
    else
      redirect_to action: :edit
    end
  end

  private

  def set_micro_goal
    @micro_goal = MicroGoal.find_by(id: params[:id])
    unless @micro_goal
      redirect_to micro_goal_path, notice: "MicroGoal not found."
    end  
  end
  
  def micro_goal_params
      params.require(:micro_goal).permit(:micro_goal, :task, :start_date, :end_date, :percentage)
  end
end
