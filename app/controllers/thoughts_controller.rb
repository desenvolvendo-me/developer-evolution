class ThoughtsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student
  before_action :set_thought, only: [:show]

  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @thoughts = @student.thoughts.all
    end
  end

  def show;end

  def new
    @thought = Thought.new
  end

  def create
    @thought = Thought.new(thought_params)
    @thought.student_id = current_user.student.id

    if @thought.save
      flash[:notice] = t('thoughts.create.success')
      redirect_to thought_path(@thought)
    else
      logger.error @thought.errors.full_messages
      flash[:error] = @thought.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @thought = Thought.find(params[:id])
  end

  def update
    @thought = Thought.find(params[:id])
    if @thought.update(thought_params)
      redirect_to thought_path(@thought), notice: t('.success')
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @thought = current_user.student.thoughts.find(params[:id])
    @thought.destroy

    redirect_to thoughts_path, notice: I18n.t('thoughts.destroy.success')
  end

  private

  def set_student
    @student = current_user.student
  end

  def set_thought
    @thought = current_user.student.thoughts.find_by(id: params[:id])
  end

  def thought_params
    params.require(:thought).permit(:level, :description, :type_thought, :student_id)
  end
end
