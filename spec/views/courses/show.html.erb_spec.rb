require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      type_course: "Type Course"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type Course/)
  end
end
