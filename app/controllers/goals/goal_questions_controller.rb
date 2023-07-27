class Goals::GoalQuestionsController < ApplicationController
  before_action :set_goal
  before_action :set_goal_question, only: [:show, :edit, :update, :destroy]

  # GET /goal_questions
  def index
    @goal_questions = @goal.goal_questions
  end

  # GET /goal_questions/1
  def show;end

  # GET /goal_questions/1
  def new
    @goal_question = @goal.goal_questions.build
  end

  # GET /goal_questions/1/edit
  def edit;end

  # POST /goal_questions
  def create
    @goal_question = @goal.goal_questions.build(goal_question_params)

    if @goal_question.save
      redirect_to goal_goal_questions_path(@goal), notice: 'Goal question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /goal_questions/1
  def update
    if @goal_question.update(goal_question_params)
      redirect_to goal_goal_question_path(@goal), notice: 'Goal question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /goal_questions/1
  def destroy
    @goal_question.destroy
    redirect_to goal_goal_questions_path(@goal), notice: 'Goal question was successfully destroyed.'
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_goal_question
    @goal_question = @goal.goal_questions.find(params[:id])
  end

  def goal_question_params
    params.require(:goal_question).permit(:type_question, :description, :answer, :goal_id)
  end
end
