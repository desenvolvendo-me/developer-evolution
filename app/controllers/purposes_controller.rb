class PurposesController < ApplicationController

  def new
    @purpose = Purpose.new
  end
  def create
    if current_user.student
      @purpose = current_user.student.purpose.new(purpose_params)
      if @purpose.save
        redirect_to @purpose, notice: "Purpose was successfully created."
      else
        flash[:notice] = "There were some errors with your purpose."
        render :new
      end
    else
      flash[:notice] = "You must have a student associated with you to create a purpose."
      render :new
    end
  end

  def index
    @purposes = current_user.student.purposes
  end


  private

  def purpose_params
    params.require(:purpose).permit(:version, :time, :type_question, :question, :answer)
  end

  def student
    current_user.student
  end

end
