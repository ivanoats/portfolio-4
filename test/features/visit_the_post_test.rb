require "test_helper"

feature "VisitThePost" do
  scenario "visited a post created" do
    @post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(@post)

    page.must_have_content "Becoming a Code Fellow"
    page.must_have_content "Means striving for excellence."
  end
end
