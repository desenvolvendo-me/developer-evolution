class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = current_user.student.portfolios
  end

  def show
    @portfolio_releases = @portfolio.portfolio_releases
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.student.portfolios.build(portfolio_params)
    if @portfolio.save
      redirect_to @portfolio, notice: 'Portfolio was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.'
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:name, :repository_link, :project_link, :readme_link)
  end
end

