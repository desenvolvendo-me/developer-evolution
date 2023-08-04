class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = current_user.student.tests
  end

  def show
    @test = Test.find(params[:id])
    @tests_battles = @test.tests_battles.includes(:tests_issues)
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
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render :show
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
    params.require(:test).permit(
      :repository_link, :project_link, :readme_link,
      tests_battles_attributes: [:id, :battle, :milestone_release_link, :pull_request_release_link,
                                 tests_issues_attributes: [:id, :issue_link, :pull_request_link]]
    )
  end
end
