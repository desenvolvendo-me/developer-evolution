class ExperiencesController < InheritedResources::Base

  private

    def experience_params
      params.require(:experience).permit(:student_id, :content, :category, :level, :week)
    end

end
