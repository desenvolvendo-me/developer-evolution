require 'rails_helper'

RSpec.describe "purposes/index", type: :view do
  before(:each) do
    assign(:purposes, [
      Purpose.create!(
        version: 2,
        time: 3,
        type_question: "Type Question",
        question: "MyText",
        answer: "MyText"
      ),
      Purpose.create!(
        version: 2,
        time: 3,
        type_question: "Type Question",
        question: "MyText",
        answer: "MyText"
      )
    ])
  end

  it "renders a list of purposes" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Type Question".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
