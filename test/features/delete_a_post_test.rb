require "test_helper"

feature "DeleteAPost" do
  scenario "test was deleted" do
     @post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    #open post
    visit post_path(@post)
    click_on 'Back'
    click_on 'Destroy'
  end
end
