require 'rails_helper'

RSpec.feature "Creating Exercises" do
    before do
      @john = User.create!(first_name: "John",last_name: "Nash",email: "john@mail.com", password:"password")
      login_as(@john)
    end

    scenario "with valid inputs" do
      visit "/"

      click_link "My Lounge"
      click_link "New Workout"
      expect(page).to have_link("Back")

      fill_in "Duration", with: 70
      fill_in "Workout details", with: "Weight lifting"
      fill_in "Activity date", with: "2015-08-07"
      click_button "Create Exercise"

      expect(page).to have_content("Exercise has been created")
      exercise = Exercise.last
      expect(page.current_path).to eq(user_exercise_path(@john, exercise))
    end
end
