class PreparationReleasesController < ApplicationController
  before_action :set_preparation
  before_action :set_preparation_release, only: [:show, :edit, :update, :destroy]

  def index
    @preparation_releases = @preparation.preparation_releases
  end

  def show
  end

  def new
    @preparation_release = @preparation.preparation_releases.new
  end

  def create
    @preparation_release = @preparation.preparation_releases.new(preparation_release_params)
    if @preparation_release.save
      redirect_to preparation_preparation_release_path(@preparation, @preparation_release), notice: 'Preparation Release was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @preparation_release.update(preparation_release_params)
      redirect_to preparation_preparation_release_path(@preparation, @preparation_release), notice: 'Preparation Release was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @preparation_release.destroy
    redirect_to preparation_preparation_releases_url(@preparation), notice: 'Preparation Release was successfully destroyed.'
  end

  private

  def set_preparation
    @preparation = Preparation.find(params[:preparation_id])
  end

  def set_preparation_release
    @preparation_release = @preparation.preparation_releases.find(params[:id])
  end

  def preparation_release_params
    params.require(:preparation_release).permit(:milestone_release_link, :pull_request_release_link)
  end
end
