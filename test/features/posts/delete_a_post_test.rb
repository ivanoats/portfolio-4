require "test_helper"

def set_up_author_post
  sign_in_user(users(:two))
  visit posts_path
  click_on "New Post"
  fill_in "Title", with: "author's title"
  fill_in "Body", with: "author's body"
  click_on "Create Post"
  post_id = current_url.split('/').last
end

feature "DeleteAPost" do
  scenario "post was deleted" do

    @post_value= posts(:sample_post).id
    #open post
    sign_in_user(users(:one))
    visit posts_path

    click_link('Destroy', href: "/posts/#{@post_value}")
    page.wont_have_content posts(:sample_post)
  end

  scenario "unauthenticated visitors should not be able to delete posts" do
    @post_value= posts(:sample_post).id
    page.wont_have_link "Destroy"
    visit posts_path
  end

  scenario "An editor can delete anyone's posts" do
    post_id = set_up_author_post
    click_link "Sign Out"
    sign_in_user(users(:editor))
    visit posts_path
    click_link("Destroy", href: "/posts/#{post_id}")
    page.wont_have_content "author's title destroy"
  end
end
