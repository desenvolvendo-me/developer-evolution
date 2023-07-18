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
      redirect_to @purpose, notice: t('controller.flash_create')
    else
      flash[:notice] = t('controller.flash_create')
      render :new
    end
  end

  def edit
    @purpose = Purpose.find(params[:id])
  end

  def update
    @purpose = Purpose.find(params[:id])
    if @purpose.update(purpose_params)
      flash[:notice] = t('controller.flash_update')
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
    flash[:notice] = t('controller.flash_destroy')
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
