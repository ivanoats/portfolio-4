require "test_helper"

feature "creating a comment on a post" do
  scenario "visitor can leave a comment" do
    sign_in_user(users(:viewer))
    visit post_path(posts(:sample_post))
    page.text.must_include posts(:sample_post).title
    page.text.must_include posts(:sample_post).body
    fill_in :comment_author, with: "obi-wan"
    fill_in :comment_author_url, with: "starwars.com"
    fill_in :comment_author_email, with: "theforce@google.com"
    fill_in :comment_content, with: "may the force be with you"
    click_on "Submit comment for approval"

    page.must_have_content "awaiting moderation"
  end

  scenario "invalid comment does not save" do
    sign_in_user(users(:viewer))
    visit post_path(posts(:sample_post))
    # And fill out a comment with invalid attributes
    click_on "Submit comment for approval"
    # Then I should see errors about what is missing
    page.must_have_content "prohibited this comment from being saved:"
  end
end
