require 'rails_helper'

RSpec.describe "objectives/index", type: :view do
  before(:each) do
    assign(:objectives, [
      Objective.create!(
        student: nil,
        title: "Title",
        description: "Description",
        reason: "Reason"
      ),
      Objective.create!(
        student: nil,
        title: "Title",
        description: "Description",
        reason: "Reason"
      )
    ])
  end

  it "renders a list of objectives" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Reason".to_s, count: 2
  end
end
