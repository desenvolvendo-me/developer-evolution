require 'rails_helper'

RSpec.describe "objectives/new", type: :view do
  before(:each) do
    assign(:objective, Objective.new(
      title: "MyString",
      reason: "MyText",
      people_involved: "MyText",
      resources: "MyText",
      expected_results: "MyText",
      achieved: "MyText",
      metrics: "MyText",
      student: nil
    ))
  end

  it "renders new objective form" do
    render

    assert_select "form[action=?][method=?]", objectives_path, "post" do

      assert_select "input[name=?]", "objective[title]"

      assert_select "textarea[name=?]", "objective[reason]"

      assert_select "textarea[name=?]", "objective[people_involved]"

      assert_select "textarea[name=?]", "objective[resources]"

      assert_select "textarea[name=?]", "objective[expected_results]"

      assert_select "textarea[name=?]", "objective[achieved]"

      assert_select "textarea[name=?]", "objective[metrics]"

      assert_select "input[name=?]", "objective[student_id]"
    end
  end
end
