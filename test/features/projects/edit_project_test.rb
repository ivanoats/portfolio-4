require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do

  before :each do
    DatabaseCleaner.strategy = :truncation
    puts "\nI'm in the before each in my edit project test\n"
    DatabaseCleaner.start
  end

  after :each do
    puts "\nI'm in the after each in my edit project test\n\n\n\n\n"
    DatabaseCleaner.clean
  end

  scenario "editing an existing project" do
    sign_in_user(users(:one))
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
    sign_in_user(users(:one))

    visit edit_project_path(projects(:one))
    fill_in "Name", with: projects(:invalid_data).name
    click_on "Update Project"

    #then changes should not be saved and I should get to try again
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
  end

  scenario "using ajax to edit project", js: true do
    sign_in_user(users(:editor))
    visit projects_path

    click_on("edit_project_link_#{projects(:one).id}")

    fill_in "Name", with: projects(:two).name
    click_on "Update Project"
    page.text.must_include projects(:two).name
  end
end

#useless comment
