require 'rails_helper'

RSpec.describe "micro_goals/show", type: :view do
  before(:each) do
    @micro_goal = assign(:micro_goal, MicroGoal.create!(
      micro_goal: "Micro Goal",
      task: "Task",
      percentage: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Micro Goal/)
    expect(rendered).to match(/Task/)
    expect(rendered).to match(/2.5/)
  end
end
