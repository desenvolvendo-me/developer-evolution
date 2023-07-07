require 'rails_helper'

RSpec.describe "micro_goals/index", type: :view do
  before(:each) do
    assign(:micro_goals, [
      MicroGoal.create!(
        micro_goal: "Micro Goal",
        task: "Task",
        percentage: 2.5
      ),
      MicroGoal.create!(
        micro_goal: "Micro Goal",
        task: "Task",
        percentage: 2.5
      )
    ])
  end

  it "renders a list of micro_goals" do
    render
    assert_select "tr>td", text: "Micro Goal".to_s, count: 2
    assert_select "tr>td", text: "Task".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
