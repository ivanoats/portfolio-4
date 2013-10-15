require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "Project was deleted" do
    @project_value= projects(:one).id
    visit projects_path
    puts "/projects/#{@project_value}"
    click_link('Destroy', href: "/projects/#{@project_value}")
    page.wont_have_content projects(:one)
  end
end
