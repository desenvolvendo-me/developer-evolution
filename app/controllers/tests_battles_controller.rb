class TestsBattlesController < ApplicationController
  before_action :set_test
  before_action :set_tests_battle, only: [:show, :edit, :update, :destroy]

  def index
    @tests_battles = @test.tests_battles
  end

  def show
  end

  def new
    @tests_battle = @test.tests_battles.build
  end

  def create
    @tests_battle = @test.tests_battles.build(tests_battle_params)

    if @tests_battle.save
      redirect_to test_tests_battle_path(@test, @tests_battle), notice: 'Tests Battle was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tests_battle.update(tests_battle_params)
      redirect_to test_tests_battle_path(@test, @tests_battle), notice: 'Tests Battle was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tests_battle.destroy
    redirect_to test_tests_battles_path(@test), notice: 'Tests Battle was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_tests_battle
    @tests_battle = @test.tests_battles.find(params[:id])
  end

  def tests_battle_params
    params.require(:tests_battle).permit(:battle, :milestone_release_link, :pull_request_release_link)
  end
end