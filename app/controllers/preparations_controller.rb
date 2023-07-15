class PreparationsController < ApplicationController
  before_action :set_preparation, only: [:show, :edit, :update, :destroy]
  def index
    @preparations = current_user.student.preparations.all
  end

  def new
    @preparation = Preparation.new
  end

  def create
    @preparation = current_user.student.preparations.build(preparation_params)

    if @preparation.save
      flash[:notice] = 'preparation.controller.flash_create'
      redirect_to action: :show, id: @preparation.id
    else
      flash[:alert] = @preparation.errors.full_messages.join('. ')
      render :new
    end
  end

  def show;end

  def update
    if @preparation.update(preparation_params)
      flash[:notice] = 'Preparação atualizada com sucesso.'
      redirect_to action: :show, id: @preparation.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @preparation.destroy
    flash[:notice] = 'Preparação excluída com sucesso.'
    redirect_to preparations_path
  end

  private

  def set_preparation
    @preparation = Preparation.find(params[:id])
  end

  def preparation_params
    params.require(:preparation).permit(:name, :project, :readme, :link, :release, :release_type)
  end
end

