require "test_helper"

feature "my home page" do
  scenario "has a welcome headline" do
    visit "http://localhost:3000"
    page.text.must_include "Andre's Portfolio"
  end
end
