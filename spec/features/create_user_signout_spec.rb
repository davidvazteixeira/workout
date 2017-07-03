require 'rails_helper'
require 'support/macros'

RSpec.feature "User Sign Out" do
  
  before do
    @john = User.create!(first_name: "John",last_name: "Nash", password: "password", email: "john@mail.com")
  end

  scenario "sucessfully" do
    login_as(@john)
    
    visit "/"
    expect(page).to have_content(@john.email)
    click_link "Log out"
    expect(page).not_to have_content(@john.email)
  end
end
