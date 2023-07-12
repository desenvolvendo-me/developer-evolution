require 'rails_helper'

RSpec.describe "objectives/edit", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      student: nil,
      title: "MyString",
      description: "MyString",
      reason: "MyString"
    ))
  end

  it "renders the edit objective form" do
    render

    assert_select "form[action=?][method=?]", objective_path(@objective), "post" do

      assert_select "input[name=?]", "objective[student_id]"

      assert_select "input[name=?]", "objective[title]"

      assert_select "input[name=?]", "objective[description]"

      assert_select "input[name=?]", "objective[reason]"
    end
  end
end
