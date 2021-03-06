require 'rails_helper'

RSpec.feature "Creating Exercises" do
    before do
      @john = User.create!(first_name: "John",last_name: "Nash",email: "john@mail.com", password:"password")
      login_as(@john)
      visit "/"

      click_link "My Lounge"
      click_link "New Workout"
      expect(page).to have_link("Back")
    end

    scenario "with valid inputs" do

      fill_in "Duration", with: 70
      fill_in "Workout details", with: "Weight lifting"
      fill_in "Activity date", with: Date.today
      click_button "Create Exercise"

      expect(page).to have_content("Exercise has been created")
      exercise = Exercise.last
      expect(page.current_path).to eq(user_exercise_path(@john, exercise))
    end

    scenario "with invalid inputs" do
      click_button "Create Exercise"
      expect(page).to have_content("Exercise has not been created")
      expect(page).to have_content("Duration in min can't be blank")
      expect(page).to have_content("Duration in min is not a number")
      expect(page).to have_content("Workout can't be blank")
      expect(page).to have_content("Workout date can't be blank")
    end
end
