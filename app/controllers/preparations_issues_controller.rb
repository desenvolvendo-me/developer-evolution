class PreparationsIssuesController < ApplicationController
  before_action :set_preparation
  before_action :set_preparations_release
  before_action :set_preparations_issue, only: [:show, :edit, :update, :destroy]

  def index
    @preparations_issues = @preparations_release.preparations_issues
  end

  def show
  end

  def new
    @preparations_issue = @preparations_release.preparations_issues.build
  end

  def create
    @preparations_issue = @preparations_release.preparations_issues.build(preparations_issue_params)

    if @preparations_issue.save
      redirect_to preparation_preparations_release_preparations_issue_path(@preparation, @preparations_release, @preparations_issue),
                  notice: t('preparation_issue.controller.create')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @preparations_issue.update(preparations_issue_params)
      redirect_to preparation_preparations_release_preparations_issue_path(@preparation, @preparations_release, @preparations_issue),
                  notice: t('preparation_issue.controller.update')
    else
      render :edit
    end
  end

  def destroy
    @preparations_issue.destroy
    redirect_to preparation_preparations_release_preparations_issues_path(@preparation, @preparations_release),
                notice: t('preparation_issue.controller.destroy')
  end

  private

  def set_preparation
    @preparation = Preparation.find(params[:preparation_id])
  end

  def set_preparations_release
    @preparations_release = @preparation.preparations_releases.find(params[:preparations_release_id])
  end

  def set_preparations_issue
    @preparations_issue = @preparations_release.preparations_issues.find(params[:id])
  end

  def preparations_issue_params
    params.require(:preparations_issue).permit(:issue_link, :pull_request_link)
  end
end
