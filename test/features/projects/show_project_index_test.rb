require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing all projects" do
    visit projects_path
    page.text.must_include projects(:one).name
    page.text.must_include projects(:one).technologies_used
  end
end
