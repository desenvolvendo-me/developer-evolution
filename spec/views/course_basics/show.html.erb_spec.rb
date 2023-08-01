require 'rails_helper'

RSpec.describe "course_basics/show", type: :view do
  before(:each) do
    @course_basic = assign(:course_basic, CourseBasic.create!(
      link_course: "Link Course",
      link_repository: "Link Repository",
      link_certified: "Link Certified",
      avaliation_course: "Avaliation Course",
      avaliation_apprenticeship: "Avaliation Apprenticeship",
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link Course/)
    expect(rendered).to match(/Link Repository/)
    expect(rendered).to match(/Link Certified/)
    expect(rendered).to match(/Avaliation Course/)
    expect(rendered).to match(/Avaliation Apprenticeship/)
    expect(rendered).to match(//)
  end
end
