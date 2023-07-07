require 'rails_helper'

RSpec.describe "micro_goals/edit", type: :view do
  before(:each) do
    @micro_goal = assign(:micro_goal, MicroGoal.create!(
      micro_goal: "MyString",
      task: "MyString",
      percentage: 1.5
    ))
  end

  it "renders the edit micro_goal form" do
    render

    assert_select "form[action=?][method=?]", micro_goal_path(@micro_goal), "post" do

      assert_select "input[name=?]", "micro_goal[micro_goal]"

      assert_select "input[name=?]", "micro_goal[task]"

      assert_select "input[name=?]", "micro_goal[percentage]"
    end
  end
end
