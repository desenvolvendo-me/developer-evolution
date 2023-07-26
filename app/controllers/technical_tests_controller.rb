class TechnicalTestsController < ApplicationController
  before_action :set_technical_test, only: [:show, :edit, :update, :destroy]

  def index
    @technical_tests = current_user.student.technical_tests.all
  end

  def show
  end

  def new
    @technical_test = TechnicalTest.new
  end

  def create
    @technical_test = current_user.student.technical_tests.build(technical_test_params)

    if @technical_test.save
      redirect_to @technical_test, notice: 'Technical Test was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @technical_test.update(technical_test_params)
      redirect_to @technical_test, notice: 'Technical Test was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @technical_test.destroy
    redirect_to technical_tests_url, notice: 'Technical Test was successfully destroyed.'
  end

  private

  def set_technical_test
    @technical_test = TechnicalTest.find(params[:id])
  end

  def technical_test_params
    params.require(:technical_test).permit(:name, :project, :readme, :link, :battle, :release_type)
  end
end

