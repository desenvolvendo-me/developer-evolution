class ObjectivesController < InheritedResources::Base

  private

    def objective_params
      params.require(:objective).permit(:title)
    end

end
