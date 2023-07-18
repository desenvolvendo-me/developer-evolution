class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  before_action :get_student

  def show
  end

  def ballast
    @discipline = Ballasts::Discipline.call(resource: current_user.student)
  end

  private

  def get_student
    @student = Student.friendly.find(params[:login])
  end

end
