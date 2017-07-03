require 'rails_helper'

RSpec.feature "Sign up User" do

  scenario "Sign up user with valid credentials" do
    visit "/"

    @john = User.new(first_name: "John",last_name: "Nash",email: "john@mail.com")

    click_link "Sign Up"

    fill_in "First name", with: @john.first_name
    fill_in "Last name", with: @john.last_name
    fill_in "Email", with: @john.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
    expect(page).to have_content(@john.email)
    expect(page).to have_content("Hi #{@john.first_name} #{@john.last_name}")
  end

end
