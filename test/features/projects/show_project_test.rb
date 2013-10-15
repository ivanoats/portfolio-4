require "test_helper"

feature "As a site visitor I want to be able to view a single project" do
  scenario "viewing one project" do
    visit project_path(projects(:one))
    page.text.must_include projects(:one).name
    page.text.must_include projects(:one).technologies_used
  end
end
