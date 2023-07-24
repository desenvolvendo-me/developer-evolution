class ObjectiveQuestionsController < ObjectivesController
  before_action :set_objective

  def index
    @objective_questions = @objective.objective_questions
  end

  def show
    @objective_question = @objective.objective_questions.find(params[:id])
  end
  def new
    @objective_question = @objective.objective_questions.build
  end

  def create
    # @objective_question = @objective.objective_questions.new(objective_question_params)
    @objective_question = @objective.objective_questions.build(objective_question_params)

    if @objective_question.save
      redirect_to @objective, notice: 'Objective question was successfully created.'
    else
      render :new
    end
  end

  def edit
    @objective_question = @objective.objective_questions.find(params[:id])
  end

  def update
    @objective_question = @objective.objective_questions.find(params[:id])

    if @objective_question.update(objective_question_params)
      redirect_to @objective, notice: 'Objective question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @objective_question = @objective.objective_questions.find(params[:id])
    @objective_question.destroy

    redirect_to objective_objective_questions_path, notice: 'Objective question was successfully destroyed.'
  end

  private

  def set_objective
    @objective = Objective.find(params[:objective_id])
  end

  def objective_question_params
    params.require(:objective_question).permit(:type_question, :description, :answer)
  end
end
