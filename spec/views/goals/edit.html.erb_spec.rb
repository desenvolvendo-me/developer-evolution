require 'rails_helper'

RSpec.describe "goals/edit", type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!(
      description: "MyString",
      student: nil
    ))
  end

  it "renders the edit goal form" do
    render

    assert_select "form[action=?][method=?]", goal_path(@goal), "post" do

      assert_select "input[name=?]", "goal[description]"

      assert_select "input[name=?]", "goal[student_id]"
    end
  end
end
