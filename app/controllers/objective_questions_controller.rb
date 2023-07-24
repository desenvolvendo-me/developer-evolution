class ObjectiveQuestionsController < InheritedResources::Base

  private

    def objective_question_params
      params.require(:objective_question).permit(:objective_id, :type_question, :description, :answer)
    end

end
