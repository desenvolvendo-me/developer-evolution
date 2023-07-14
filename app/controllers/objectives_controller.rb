class ObjectivesController < InheritedResources::Base

  private

    def objective_params
      params.require(:objective).permit(:title, :reason, :people_involved, :resources, :expected_results, :achieved, :metrics, :max_deadline, :min_deadline, :student_id)
    end

end
