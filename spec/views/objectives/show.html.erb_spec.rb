require 'rails_helper'

RSpec.describe "objectives/show", type: :view do
  before(:each) do
    @objective = assign(:objective, Objective.create!(
      title: "Title",
      reason: "MyText",
      people_involved: "MyText",
      resources: "MyText",
      expected_results: "MyText",
      achieved: "MyText",
      metrics: "MyText",
      student: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
