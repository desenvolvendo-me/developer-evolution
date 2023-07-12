require 'rails_helper'

RSpec.describe "objectives/new", type: :view do
  before(:each) do
    assign(:objective, Objective.new(
      student: nil,
      title: "MyString",
      description: "MyString",
      reason: "MyString"
    ))
  end

  it "renders new objective form" do
    render

    assert_select "form[action=?][method=?]", objectives_path, "post" do

      assert_select "input[name=?]", "objective[student_id]"

      assert_select "input[name=?]", "objective[title]"

      assert_select "input[name=?]", "objective[description]"

      assert_select "input[name=?]", "objective[reason]"
    end
  end
end
