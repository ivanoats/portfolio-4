require "test_helper"

feature "DeleteAPost" do
  scenario "test was deleted" do

    @post_value= posts(:sample_post).id
    #open post
    visit posts_path
    puts "/posts/#{@post_value}"
    save_and_open_page
    click_link('Destroy', href: "/posts/#{@post_value}")
    page.wont_have_content posts(:sample_post)
  end
end
