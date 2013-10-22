require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    #given a valid user

    visit new_project_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    fill_in "Name", with: projects(:one).name
    fill_in "Technologies used", with: projects(:one).technologies_used
    click_on "Create Project"
    page.text.must_include "Project was successfully created"
    page.text.must_include projects(:one).name
    page.text.must_include projects(:one).technologies_used
  end


  scenario "new project has invalid data" do
    #given invalid project data is entered in a form
    sign_in_user(users(:one))
    visit new_project_path
    fill_in "Name", with: projects(:invalid_data).name

    #when the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"

    #then the form should be displayed again, with an error message.
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end

end
