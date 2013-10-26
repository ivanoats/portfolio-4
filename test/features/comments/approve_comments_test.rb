require 'test_helper'
feature "As an author or editor I want to approve comments so there's no spam " do

  before do
    sign_in_user(users(:viewer))
    visit post_path(posts(:sample_post))
    fill_in :comment_author,       with: "troll"
    fill_in :comment_author_url,   with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_content,      with: "trolling"
    click_on "Submit comment for approval"
    click_on "Sign Out"
  end

  scenario "Comments not be displayed until approved" do
    visit post_path(posts(:sample_post))
    page.wont_have_content "trolling"
  end

  scenario "editor can approve comment" do
    sign_in_user(users(:editor))
    visit post_path(posts(:sample_post))
    click_on "Approve"
    click_on "Sign Out"
    visit post_path(posts(:sample_post))
    page.must_have_content "trolling"
  end
end
