class ObjectivesController < InheritedResources::Base


  def show
    @objective = Objective.find(params[:id])
  end

  def destroy
    @objective = Objective.find(params[:id])
    @objective.objective_questions.destroy_all
    @objective.destroy

    redirect_to objectives_path, notice: 'Objective and associated questions were successfully destroyed.'
  end

  private

    def objective_params
      params.require(:objective).permit(:title)
    end

end
