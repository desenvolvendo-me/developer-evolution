class PreparationsReleasesController < ApplicationController
  before_action :set_preparation
  before_action :set_preparations_release, only: [:show, :edit, :update, :destroy]

  def index
    @preparations_releases = @preparation.preparations_releases
  end

  def show
  end

  def new
    @preparations_release = @preparation.preparations_releases.build
  end

  def create
    @preparations_release = @preparation.preparations_releases.build(preparations_release_params)

    if @preparations_release.save
      redirect_to preparation_preparations_release_path(@preparation, @preparations_release),
                  notice: t('preparation_release.controller.create')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @preparations_release.update(preparations_release_params)
      redirect_to preparation_preparations_release_path(@preparation, @preparations_release),
                  notice: t('preparation_release.controller.update')
    else
      render :edit
    end
  end

  def destroy
    @preparations_release.destroy
    redirect_to preparation_preparations_releases_path(@preparation),
                notice: t('preparation_release.controller.destroy')
  end

  private

  def set_preparation
    @preparation = Preparation.find(params[:preparation_id])
  end

  def set_preparations_release
    @preparations_release = @preparation.preparations_releases.find(params[:id])
  end

  def preparations_release_params
    params.require(:preparations_release).permit(:milestone_release_link, :pull_request_release_link)
  end
end
