require 'rails_helper'

RSpec.describe "purposes/edit", type: :view do
  before(:each) do
    @purpose = assign(:purpose, Purpose.create!(
      version: 1,
      time: 1,
      type_question: "MyString",
      question: "MyText",
      answer: "MyText"
    ))
  end

  it "renders the edit purpose form" do
    render

    assert_select "form[action=?][method=?]", purpose_path(@purpose), "post" do

      assert_select "input[name=?]", "purpose[version]"

      assert_select "input[name=?]", "purpose[time]"

      assert_select "input[name=?]", "purpose[type_question]"

      assert_select "textarea[name=?]", "purpose[question]"

      assert_select "textarea[name=?]", "purpose[answer]"
    end
  end
end
