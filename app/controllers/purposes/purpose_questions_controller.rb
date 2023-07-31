class Purposes::PurposeQuestionsController < ApplicationController
  before_action :set_purpose
  before_action :set_purpose_question, only: %i[show edit update destroy]

  def new
    @purpose = Purpose.find(params[:purpose_id])
    @purpose_question = @purpose.purpose_questions.build
  end
  def index
    @purpose_questions = @purpose.purpose_questions
  end

  def create
    # @message = Message.new(message_params)
    @purpose_question = @purpose.purpose_questions.build(purpose_question_params)
    redirect_to(@purpose_question.save ? [@purpose, @purpose_question] : { action: "new" }, notice: @purpose_question.save ? t(''.controller.flash_create') : "Failed to create purpose question.")


  end

  def update
    redirect_to @purpose_question.update(purpose_question_params) ? [@purpose, @purpose_question] : edit_purpose_purpose_question_path(@purpose, @purpose_question), notice: @purpose_question.update(purpose_question_params) ? t('controller.flash_update') : "Failed to update message."
  end


  def destroy
    @purpose_question.destroy
    redirect_to [@purpose, :purpose_questions], notice: t('controller.flash_destroy')
  end


  private

    def set_purpose
      @purpose = Purpose.find(params[:purpose_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_purpose_question
      @purpose_question = @purpose.purpose_questions.find(params[:id])
    end

    def purpose_question_params
      params.require(:purpose_question).permit(:type_question, :description, :answer)
    end

end
