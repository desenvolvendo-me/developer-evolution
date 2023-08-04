class TestsIssuesController < ApplicationController
  before_action :set_test
  before_action :set_tests_battle
  before_action :set_tests_issue, only: [:show, :edit, :update, :destroy]

  def index
    @tests_issues = @tests_battle.tests_issues
  end

  def show
    @tests_issue = TestsIssue.find(params[:id])
  end

  def new
    @tests_issue = @tests_battle.tests_issues.build
  end

  def create
    @tests_issue = @tests_battle.tests_issues.build(tests_issue_params)

    if @tests_issue.save
      redirect_to test_tests_battle_tests_issue_path(@test, @tests_battle, @tests_issue), notice: 'Tests Issue was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tests_issue = TestsIssue.find(params[:id])
    @tests_battle = @tests_issue.tests_battle

    if @tests_battle.update(tests_battle_params) && @tests_issue.update(tests_issue_params)
      redirect_to @tests_issue, notice: 'Tests Issue was successfully updated.'
    else
      render :show
    end
  end

  def destroy
    @tests_issue.destroy
    redirect_to test_tests_battle_tests_issues_path(@test, @tests_battle), notice: 'Tests Issue was successfully destroyed.'
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_tests_battle
    @tests_battle = @test.tests_battles.find(params[:tests_battle_id])
  end

  def set_tests_issue
    @tests_issue = @tests_battle.tests_issues.find(params[:id])
  end

  def tests_issue_params
    params.require(:tests_issue).permit(:issue_link, :pull_request_link)
  end
end
