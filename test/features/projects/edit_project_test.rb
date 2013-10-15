require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do
  scenario "editing an existing project" do
    visit edit_project_path(projects(:one))

    #when I make changes
    fill_in "Name", with: projects(:two).name
    click_on "Update Project"

    #then the changes should be saved and shown
    page.text.must_include "success"
    page.text.must_include projects(:two).name
    page.text.wont_include projects(:one).name
  end

  scenario "bad data in an edit form" do
    #given invalid data
    visit edit_project_path(projects(:one))
    fill_in "Name", with: projects(:invalid_data).name
    click_on "Update Project"

    #then changes should not be saved and I should get to try again
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
  end
end
