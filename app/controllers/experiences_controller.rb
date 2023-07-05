class ExperiencesController < InheritedResources::Base

  def new
    @experience = Experience.new
  end
  def create
    @experience = current_user.student.experiences.build(experience_params)

    if @experience.save
      flash[:success] = 'Cadastro realizado com sucesso'
      redirect_to experiences_path
    else
      render 'new'
    end
  end

  private

    def experience_params
      params.require(:experience).permit(:student_id, :content, :category, :level)
    end

end
