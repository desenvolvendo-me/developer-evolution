require 'rails_helper'

RSpec.describe "purposes/new", type: :view do
  before(:each) do
    assign(:purpose, Purpose.new(
      version: 1,
      time: 1,
      type_question: "MyString",
      question: "MyText",
      answer: "MyText"
    ))
  end

  it "renders new purpose form" do
    render

    assert_select "form[action=?][method=?]", purposes_path, "post" do

      assert_select "input[name=?]", "purpose[version]"

      assert_select "input[name=?]", "purpose[time]"

      assert_select "input[name=?]", "purpose[type_question]"

      assert_select "textarea[name=?]", "purpose[question]"

      assert_select "textarea[name=?]", "purpose[answer]"
    end
  end
end
