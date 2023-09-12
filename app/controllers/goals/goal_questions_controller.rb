class Goals::GoalQuestionsController < ApplicationController
  before_action :set_goal

  def index
    @goal = Goal.find(params[:goal_id])
    @goal_questions = @goal.goal_questions
  end

  def show;
    @goal_question = @goal.goal_questions.find(params[:id])
  end

  def new
    @goal_question = @goal.goal_questions.build
  end

  def edit
    @goal_question = @goal.goal_questions.find(params[:id])
  end

  def create
    @goal_question = @goal.goal_questions.build(goal_question_params)

    if @goal_question.save
      redirect_to goal_goal_questions_path(@goal), notice: t('goal_question.controller.successfully_created')
    else
      render :new
    end
  end

  def update
    @goal_question = @goal.goal_questions.find(params[:id])

    if @goal_question
      if @goal_question.update(goal_question_params)
        redirect_to goal_goal_question_path(@goal), notice: t('controller.micro_goal_tasks.flash_update')
      else
        render :edit
      end
    else
      redirect_to goal_goal_questions_path, alert: "Registro não encontrado."
    end
  end

  def destroy
    @goal_question = @goal.goal_questions.find(params[:id])

    if @goal_question
      @goal_question.destroy
      redirect_to goal_goal_questions_path(@goal), notice: t('goal_question.controller.successfully_destroyed')
    else
      redirect_to goal_goal_questions_path, alert: t('goal_question.controller.goal_question_not_found')
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_goal_question
    @goal_question = @goal.goal_questions.find(params[:id])
  end

  def goal_question_params
    params.require(:goal_question).permit(:type_question, :description, :answer, :goal_id)
  end
end
