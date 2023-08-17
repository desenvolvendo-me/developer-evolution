class ScriptQuestionsController < ApplicationController
  before_action :set_script_question, only: [:show, :edit, :update, :destroy]

  def index
    @script = Script.find(params[:script_id])
    @script_questions = @script.script_questions
  end

  def show
  end

  def new
    @script = Script.find(params[:script_id])
    @script_question = @script.script_questions.build
  end

  def create
    @script = Script.find(params[:script_id])
    @script_question = @script.script_questions.build(script_question_params)
    if @script_question.save
      redirect_to script_script_question_path(@script, @script_question),
                  notice: t('script.script_questions.controller.create')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @script_question.update(script_question_params)
      redirect_to script_script_question_path(@script_question.script, @script_question),
                  notice: t('script.script_questions.controller.update')
    else
      render :edit
    end
  end

  def destroy
    @script_question.destroy
    redirect_to script_script_questions_url(@script_question.script),
                notice: t('script.script_questions.controller.destroy')
  end

  private

  def set_script_question
    @script_question = ScriptQuestion.find(params[:id])
  end

  def script_question_params
    params.require(:script_question).permit(:description, :category)
  end
end

