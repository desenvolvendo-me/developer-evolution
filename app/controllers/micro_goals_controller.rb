class MicroGoalsController < InheritedResources::Base

  private

    def micro_goal_params
      params.require(:micro_goal).permit(:micro_goal, :string)
    end

end
