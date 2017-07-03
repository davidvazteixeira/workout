require 'rails_helper'

RSpec.feature "User sign in" do
  before do
    @john = User.create!(first_name: "John", last_name: "Nash", email: "jn@mail.com", password: "password")
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"

    expect(page).to have_content("Hi #{@john.first_name} #{@john.last_name} (#{@john.email})")
  end
  
  scenario "with invalid credentials" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: "new_email@mail.com"
    fill_in "Password", with: "some_password"
    click_button "Log in"

    expect(current_path).to eq(new_user_session_path)
  end
end
