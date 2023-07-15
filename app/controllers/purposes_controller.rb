class PurposesController < ApplicationController


  def show
    @purpose = Purpose.find(params[:id])
  end

  def new
    @purpose = Purpose.new
  end
  def create
    @purpose = Purpose.new(purpose_params)
    @purpose.student = current_user.student

    if @purpose.save
      redirect_to @purpose, notice: "Purpose was successfully created."
    else
      flash[:notice] = "There were some errors with your purpose."
      render :new
    end
  end

  def edit
    @purpose = Purpose.find(params[:id])
  end

  def update
    @purpose = Purpose.find(params[:id])
    if @purpose.update(purpose_params)
      flash[:notice] = 'Propósito atualizado com sucesso.'
      redirect_to purpose_path(@purpose)
    else
      render 'edit'
    end
  end

  def index
    @purposes = current_user.student.purposes
  end

  def destroy
    @purpose = Purpose.find(params[:id])
    @purpose.destroy
    flash[:notice] = 'Propósito excluído com sucesso.'
    redirect_to purposes_path
  end


  private

  def purpose_params
    params.require(:purpose).permit(:version, :time, :type_question, :question, :answer)
  end

  def student
    current_user.student
  end

end
