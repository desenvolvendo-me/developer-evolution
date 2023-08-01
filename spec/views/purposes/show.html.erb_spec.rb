require 'rails_helper'

RSpec.describe "purposes/show", type: :view do
  before(:each) do
    @purpose = assign(:purpose, Purpose.create!(
      version: 2,
      time: 3,
      type_question: "Type Question",
      question: "MyText",
      answer: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Type Question/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
