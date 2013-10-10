require "test_helper"

feature "DeleteAPost" do
  scenario "test was deleted" do
    #open post
    visit post_path
    click_on 'Back'
    click_on 'Destroy'
  end
end
