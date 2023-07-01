class MicroGoalsController < InheritedResources::Base

  private

    def micro_goal_params
      params.require(:micro_goal).permit(:micro_goal, :task, :start_date, :end_date, :percentage)
    end

end
