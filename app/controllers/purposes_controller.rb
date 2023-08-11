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
    redirect_to(@purpose.save ? @purpose : { action: "new" }, notice: t('controller.flash_create'))
  end
  def edit
    @purpose = Purpose.find(params[:id])
  end
  def update
    @purpose = Purpose.find(params[:id])
    @purpose.update(purpose_params) ? redirect_to(@purpose, notice: t('controller.flash_update')) : render(:edit)
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
    params.require(:purpose).permit(:version)
  end

  def student
    current_user.student
  end

end


