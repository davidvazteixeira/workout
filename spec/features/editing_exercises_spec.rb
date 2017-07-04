require 'rails_helper'

RSpec.feature "Editing Exercises" do
  before do
    @creating_duration = 112233
    @updating_duration = 445566
    @owner = User.create!(first_name: "Owner",last_name: "Nash",email: "owner@mail.com", password:"password")
    @owner_exer = @owner.exercises.create!(
      duration_in_min: @creating_duration,
      workout: "exec1",
      workout_date: 4.days.ago
    )
    login_as(@owner)
    visit "/"
    click_link "My Lounge"
  end

  scenario "with valid inputs succceeds" do
    link = edit_user_exercise_path(@owner, @owner_exer)
    find("a[href='#{link}']").click

    fill_in "Duration", with: @updating_duration
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(@updating_duration)
    expect(page).not_to have_content(@creating_duration)
  end
end
