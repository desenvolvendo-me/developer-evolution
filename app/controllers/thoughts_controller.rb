class ThoughtsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  def index
    @thoughts = Thought.all
  end

  def new
    @thought = Thought.new
  end

  def create
    @thought = current_user.student.thoughts.build(thought_params)

    if @thought.save
      redirect_to action: :show, id: @thought.id, notice: t('controller.flash_create')
    else
      render :new, flash[:notice] = t('controller.flash_fail')
    end
  end

  def show;end

  def update
    if @thought.update(thought_params)
      redirect_to thought_path(@thought), notice: t('controller.flash_update')
    else
      redirect_to action: :edit
    end
  end

    def destroy
      @thought.destroy
      redirect_to thoughts_path, notice: t('controller.flash_destroy')
    end

  private

  def set_thought
    @thought = current_user.student.thoughts.find(params[:id])
    # end
  end

  def thought_params
    params.require(:thought).permit(:level, :positive, :negative, :student_id)
  end
end
