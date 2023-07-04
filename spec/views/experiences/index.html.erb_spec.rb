require 'rails_helper'

RSpec.describe "experiences/index", type: :view do
  before(:each) do
    assign(:experiences, [
      Experience.create!(
        student: nil,
        content: "MyText",
        category: "Category",
        level: 2,
        week: 3
      ),
      Experience.create!(
        student: nil,
        content: "MyText",
        category: "Category",
        level: 2,
        week: 3
      )
    ])
  end

  it "renders a list of experiences" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
