require 'rails_helper'

RSpec.describe "objectives/show", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      student: nil,
      title: "Title",
      description: "Description",
      reason: "Reason"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Reason/)
  end
end
