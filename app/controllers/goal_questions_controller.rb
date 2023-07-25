class GoalQuestionsController < InheritedResources::Base

  private

    def goal_question_params
      params.require(:goal_question).permit(:type_question, :description, :answer, :goal_id)
    end

end
