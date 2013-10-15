require "test_helper"

feature "DeleteAPost" do
  scenario "post was deleted" do

    @post_value= posts(:sample_post).id
    #open post
    visit posts_path
    puts "/posts/#{@post_value}"
    click_link('Destroy', href: "/posts/#{@post_value}")
    page.wont_have_content posts(:sample_post)
  end
end
