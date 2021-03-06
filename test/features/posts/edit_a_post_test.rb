require "test_helper"

feature "Edit A post" do
  scenario "update existing post" do
    sign_in_user(users(:one))
    visit post_path(posts(:sample_post))
    click_on 'Edit'
    fill_in 'Title', with: posts(:sample_post_edit).title
    fill_in 'Body', with: posts(:sample_post_edit).body

    click_on 'Update Post'
    page.text.must_include posts(:sample_post_edit).title
    page.text.must_include posts(:sample_post_edit).body
    page.text.must_include 'Post was successfully updated'

  end
end
