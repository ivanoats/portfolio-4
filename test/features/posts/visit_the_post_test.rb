require "test_helper"

feature "VisitThePost" do
  scenario "visited a post created" do

    visit post_path(posts(:sample_post))

    page.must_have_content posts(:sample_post).title
    page.must_have_content posts(:sample_post).body
  end
end
