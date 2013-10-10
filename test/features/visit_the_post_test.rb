require "test_helper"

feature "VisitThePost" do
  scenario "visited a post created" do

    visit post_path

    page.must_have_content "Becoming a Code Fellow"
    page.must_have_content "Means striving for excellence."
  end
end
