require "test_helper"

feature "VisitThePost" do
  scenario "visited a post created" do

    visit posts_path
    page.must_have_content posts(:sample_post_edit).title
    page.text.wont_include posts(:unpublished).title
    save_and_open_page
  end

  scenario "with existing posts, editor" do
    #when I view the post index
    sign_in_user(users(:one))
    visit posts_path

    #I should be able to choose which to publish
    page.text.must_include posts(:sample_post).title
  end

  scenario "with existing posts, author" do
    sign_in_user(users(:two))
    visit posts_path
    page.text.must_include posts(:sample_post_edit).title
    page.text.must_include posts(:unpublished).title
  end
end
