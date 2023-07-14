require 'rails_helper'

RSpec.describe "objectives/index", type: :view do
  before(:each) do
    assign(:objectives, [
      Objective.create!(
        title: "Title",
        reason: "MyText",
        people_involved: "MyText",
        resources: "MyText",
        expected_results: "MyText",
        achieved: "MyText",
        metrics: "MyText",
        student: nil
      ),
      Objective.create!(
        title: "Title",
        reason: "MyText",
        people_involved: "MyText",
        resources: "MyText",
        expected_results: "MyText",
        achieved: "MyText",
        metrics: "MyText",
        student: nil
      )
    ])
  end

  it "renders a list of objectives" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
