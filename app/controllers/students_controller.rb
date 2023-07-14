class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  before_action :get_student

  def show
  end

  def ballast
  end

  private

  def get_student
    @student = Student.friendly.find(params[:login])
  end

end
