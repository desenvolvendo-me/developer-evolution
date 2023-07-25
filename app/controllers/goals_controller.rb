class GoalsController < InheritedResources::Base

  private

    def goal_params
      params.require(:goal).permit(:description, :student_id)
    end

end
