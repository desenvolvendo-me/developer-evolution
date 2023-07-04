require 'rails_helper'

RSpec.describe "experiences/show", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      student: nil,
      content: "MyText",
      category: "Category",
      level: 2,
      week: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
