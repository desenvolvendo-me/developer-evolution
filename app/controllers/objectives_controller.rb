class ObjectivesController < InheritedResources::Base

  private

    def objective_params
      params.require(:objective).permit(:student_id, :title, :description, :reason)
    end

end
