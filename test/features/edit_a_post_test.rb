require "test_helper"

feature "Edit A post" do
  scenario "update existing post" do
    @post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(@post)
    click_on 'Edit'
    fill_in 'Title', with: 'new title'
    fill_in 'Body', with: 'new body text'
    click_on 'Update Post'
    page.text.must_include 'new title'
    page.text.must_include'new body text'
    page.text.must_include 'Post was successfully updated'

  end
end
