class PortfolioReleasesController < ApplicationController
  before_action :set_portfolio
  before_action :set_portfolio_release, only: [:show, :edit, :update, :destroy]
  def index
    @portfolio_releases = @portfolio.portfolio_releases
  end

  def index
    @portfolio_releases = Portfolio.portfolio_releases
  end

  def new
    @portfolio_release = @portfolio.portfolio_releases.build
  end

  def create
    @portfolio_release = @portfolio.portfolio_releases.build(portfolio_release_params)
    if @portfolio_release.save
      redirect_to @portfolio, notice: 'Portfolio release was successfully created.'
    else
      render :new
    end
  end

  def show
    @portfolio_issues = @portfolio_release.portfolio_issues
  end

  # Other actions similar to PortfoliosController

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def set_portfolio_release
    @portfolio_release = @portfolio.portfolio_releases.find(params[:id])
  end

  def portfolio_release_params
    params.require(:portfolio_release).permit(:milestone_release_link, :pull_request_release_link)
  end
end
