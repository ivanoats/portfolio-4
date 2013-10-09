require "test_helper"

feature "Creating a post" do
  scenario "works with valid data" do
    visit posts_path

  #give a completed post form
  click_on 'New Post'
  fill_in 'Title', with: 'A new hope'
  fill_in 'Body', with: 'a long time ago'

  #when I submit the form
  click_on 'Create Post'
    page.text.must_include 'A new hope'
    page.text.must_include 'a long time ago'


  #and success message
  page.text.must_include 'Post was successfully created'
  end
end
