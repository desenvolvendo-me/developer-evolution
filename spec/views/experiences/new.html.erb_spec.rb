require 'rails_helper'

RSpec.describe "experiences/new", type: :view do
  before(:each) do
    assign(:experience, Experience.new(
      student: nil,
      content: "MyText",
      category: "MyString",
      level: 1,
      week: 1
    ))
  end

  it "renders new experience form" do
    render

    assert_select "form[action=?][method=?]", experiences_path, "post" do

      assert_select "input[name=?]", "experience[student_id]"

      assert_select "textarea[name=?]", "experience[content]"

      assert_select "input[name=?]", "experience[category]"

      assert_select "input[name=?]", "experience[level]"

      assert_select "input[name=?]", "experience[week]"
    end
  end
end
