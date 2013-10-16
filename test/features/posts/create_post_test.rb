require "test_helper"

feature "Creating a post" do
  scenario "works with valid data" do
    #given a signed_in user
    sign_in_user
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
end
