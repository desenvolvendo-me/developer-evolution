class StudentsController < ApplicationController

  def show
    @student = Student.friendly.find(params[:login])
  end

end
