class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = current_user.student.tests
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.student.tests.build(test_params)

    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      flash[:notice] = 'Test was successfully updated.'
      redirect_to action: :show, id: @test.id
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  private

  def student
    current_user.student
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:repository_link, :project_link, :readme_link)
  end
end
