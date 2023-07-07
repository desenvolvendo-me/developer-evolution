require 'rails_helper'

RSpec.describe "micro_goals/new", type: :view do
  before(:each) do
    assign(:micro_goal, MicroGoal.new(
      micro_goal: "MyString",
      task: "MyString",
      percentage: 1.5
    ))
  end

  it "renders new micro_goal form" do
    render

    assert_select "form[action=?][method=?]", micro_goals_path, "post" do

      assert_select "input[name=?]", "micro_goal[micro_goal]"

      assert_select "input[name=?]", "micro_goal[task]"

      assert_select "input[name=?]", "micro_goal[percentage]"
    end
  end
end
