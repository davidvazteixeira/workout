require 'rails_helper'

RSpec.feature "Creating Home Page" do
  scenario "visiting home" do
    visit "/"
  
    expect(page).to have_link("Athletes Den")
    expect(page).to have_link("Home")
    expect(page).to have_content("Working Lounge")

  end
end
