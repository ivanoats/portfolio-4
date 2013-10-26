require "test_helper"

feature "As a site visitor I want to comment
  on projects so that I can troll my friends" do

  scenario "comment on projects" do
    #given a project
    #when I visit the project path
    sign_in_user(users(:author))
    visit project_path(projects(:one))
    fill_in :comment_author, with: "troll one"
    fill_in :comment_author_email, with: "troll@troll.com"
    fill_in :comment_author_url, with: "http://troll.com"
    fill_in :comment_content,  with: "noob"
    click_on "Submit comment for approval"
    page.must_have_content "awaiting moderation"
  end

  scenario "invalid comment does not save" do
    #given a published post when I visit the path
    sign_in_user(users(:author))
    visit project_path(projects(:one))
    #fill out a comment with invalid data
    click_on "Submit comment for approval"
    #I should see errors of what's missing
    page.must_have_content "prohibited this comment from being saved"
  end
end
