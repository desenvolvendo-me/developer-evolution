require 'rails_helper'

RSpec.describe "experiences/edit", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      student: nil,
      content: "MyText",
      category: "MyString",
      level: 1
    ))
  end

  it "renders the edit experience form" do
    render

    assert_select "form[action=?][method=?]", experience_path(@experience), "post" do

      assert_select "input[name=?]", "experience[student_id]"

      assert_select "textarea[name=?]", "experience[content]"

      assert_select "input[name=?]", "experience[category]"

      assert_select "input[name=?]", "experience[level]"
    end
  end
end
