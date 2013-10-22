require "test_helper"

feature "Creating a post" do
  scenario "works with valid data" do
    #given a signed_in user
    sign_in_user(users(:one))
    visit new_post_path

    fill_in 'Title', with: posts(:sample_post).title
    fill_in 'Body', with: posts(:sample_post).body

    #when I submit the form
    click_on 'Create Post'
      page.text.must_include posts(:sample_post).title
      page.text.must_include posts(:sample_post).body

    #and success message
    page.text.must_include 'Post was successfully created'
    page.has_css? "#author"
    page.text.must_include users(:one).email
  end

  scenario "Authors can't publish" do
    sign_in_user(users(:one))
    visit new_post_path
    #no checkbox for published
    page.wont_have_field ('published')
  end

  scenario "only editors can publish" do
    sign_in_user(users(:one))
    visit edit_post_path(posts(:unpublished))
    page.check('Published')
    click_button "Update Post"
    page.must_have_content "was successfully updated"
    visit posts_path
    page.must_have_content posts(:unpublished).title
  end
end
