class ExperiencesController < InheritedResources::Base

  def new
    @experience = Experience.new
    render :new
  end
  def create
    @experience = current_user.student.experiences.build(experience_params)

    if @experience.save
      flash[:notice] = 'Experiência cadastrada com sucesso'
      redirect_to experiences_path
    else
      flash[:alert] = @experience.errors.full_messages.join('. ')
      redirect_to experiences_path
    end
  end

  private

    def experience_params
      params.require(:experience).permit(:student_id, :content, :category, :level, :week)
    end

end
