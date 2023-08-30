class PortfolioIssuesController < ApplicationController
  before_action :set_portfolio
  before_action :set_portfolio_release
  before_action :set_portfolio_issue, only: [:show, :edit, :update, :destroy]

  def new
    @portfolio_issue = @portfolio_release.portfolio_issues.build
  end

  def create
    @portfolio_issue = @portfolio_release.portfolio_issues.build(portfolio_issue_params)
    if @portfolio_issue.save
      redirect_to portfolio_portfolio_release_path(@portfolio, @portfolio_release),
                  notice: 'Portfolio issue was successfully created.'
    else
      render :new
    end
  end

  # Other actions similar to PortfoliosController

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def set_portfolio_release
    @portfolio_release = @portfolio.portfolio_releases.find(params[:portfolio_release_id])
  end

  def set_portfolio_issue
    @portfolio_issue = @portfolio_release.portfolio_issues.find(params[:id])
  end

  def portfolio_issue_params
    params.require(:portfolio_issue).permit(:issue_link, :pull_request_link)
  end
end
