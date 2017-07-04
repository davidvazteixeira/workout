require 'rails_helper'

RSpec.feature "Deleting Exercise" do
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

  scenario "successfully" do
    link = user_exercise_path(@owner, @owner_exer)
    find(:css, "a[href='#{link}']", text: "Destroy").click
  end
end
