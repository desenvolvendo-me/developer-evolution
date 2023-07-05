class ExperiencesController < InheritedResources::Base

  def new
    @experience = Experience.new
  end
  def create
    @experience = current_user.experiences.build(experience_params)
  end

  private

    def experience_params
      params.require(:experience).permit(:student_id, :content, :category, :level)
    end

end
