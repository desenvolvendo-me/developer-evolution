class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  before_action :get_student

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to root_path, notice: I18n.t('student.controller.update')
    else
      render :edit
    end
  end

  def ballast
    @discipline = Ballasts::Discipline.call(resource: current_user.student)
  end

  private

  def get_student
    @student = Student.friendly.find(params[:login])
  end

  def student_params
    params.require(:student).permit(
      :name,
      :type_career,
      :description_career,
      :salary,
      :profile_discord,
      :github_link,
      :wakatime_link,
      :linkedin_link,
      :time_available
    )
  end

end
