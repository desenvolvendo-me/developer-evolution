class PreparationIssuesController < ApplicationController
  before_action :set_preparation_release
  before_action :set_preparation_issue, only: [:show, :edit, :update, :destroy]

  def index
    @preparation_issues = @preparation_release.preparation_issues
  end

  def show
  end

  def new
    @preparation_issue = @preparation_release.preparation_issues.new
  end

  def create
    @preparation_issue = @preparation_release.preparation_issues.new(preparation_issue_params)
    if @preparation_issue.save
      redirect_to preparation_preparation_release_preparation_issue_path(@preparation, @preparation_release, @preparation_issue), notice: 'Preparation Issue was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @preparation_issue.update(preparation_issue_params)
      redirect_to preparation_preparation_release_preparation_issue_path(@preparation, @preparation_release, @preparation_issue), notice: 'Preparation Issue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @preparation_issue.destroy
    redirect_to preparation_preparation_release_preparation_issues_url(@preparation, @preparation_release), notice: 'Preparation Issue was successfully destroyed.'
  end

  private

  def set_preparation_release
    @preparation = Preparation.find(params[:preparation_id])
    @preparation_release = @preparation.preparation_releases.find(params[:preparation_release_id])
  end

  def set_preparation_issue
    @preparation_issue = @preparation_release.preparation_issues.find(params[:id])
  end

  def preparation_issue_params
    params.require(:preparation_issue).permit(:issue_link, :pull_request_link)
  end
end
