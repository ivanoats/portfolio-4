require "test_helper"

feature "
      As a site visitor I want to be able to
      sign out of my account so when I exit
      my session my account is secure" do
  scenario "sign out current user" do
    visit new_user_session_path
    sign_in_user
    page.must_have_content "Signed in successfully"
    page.must_have_content "Sign Out"

    # When the sign out link is clicked
    click_on "Sign Out"

    # Then the session should be destroyed
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Sign Out"
  end
end
