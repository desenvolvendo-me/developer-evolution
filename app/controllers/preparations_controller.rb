class PreparationsController < ApplicationController
  before_action :set_preparation, only: [:show, :edit, :update, :destroy]
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def index
    @preparations = Preparation.all
  end

  def show
  end

  def new
    @preparation = Preparation.new
  end

  def create
    @preparation = Preparation.new(preparation_params)

    if @preparation.save
      redirect_to @preparation, notice: 'Preparation was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @preparation.update(preparation_params)
      redirect_to @preparation, notice: 'Preparation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @preparation.destroy
    redirect_to preparations_url, notice: 'Preparation was successfully destroyed.'
  end

  private

  def set_preparation
    @preparation = Preparation.find(params[:id])
  end

  def preparation_params
    params.require(:preparation).permit(:name, :project, :readme, :link, :release, :release_type)
  end
end

