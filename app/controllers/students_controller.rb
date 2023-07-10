class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @student = Student.friendly.find(params[:login])
  end

end
