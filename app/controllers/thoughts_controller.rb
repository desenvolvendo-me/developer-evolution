class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  def index
    @thoughts = current_user.student.thoughts.all
  end

  def new
    @thought = Thought.new
    @action = t('controller.thoughts.new.submit')
  end

  def create

    @thought = current_user.student.thoughts.build(thought_params)

    if @thought.save
      flash[:notice] = t('controller.thoughts.flash_create')
      redirect_to action: :show, id: @thought.id
    else
      flash[:alert] = @thought.errors.full_messages.join('. ')
      redirect_to thoughts_path
    end
  end

  def show;end

  def edit
    @action = t('controller.thoughts.edit.submit')
  end

  def update
    if @thought.update(thought_params)
      flash[:notice] = t('controller.thoughts.flash_update')
      redirect_to action: :show, id: @thought.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @thought.destroy
    flash[:notice] = t('controller.thoughts.flash_destroy')
    redirect_to thoughts_path
  end

  private

  def set_thought
    @thought = current_user.student.thoughts.find(params[:id])
  end

  def thought_params
      params.require(:thought).permit(:student_id, :level, :positive, :negative)
  end
end
