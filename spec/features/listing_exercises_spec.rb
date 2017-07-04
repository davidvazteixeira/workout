require 'rails_helper'

RSpec.feature "Listing Exercises" do
  
    before do
      @john = User.create!(first_name: "John",last_name: "Nash", password: "password", email: "john@mail.com")
      login_as(@john)

      @e1 = @john.exercises.create!(duration_in_min: 20, workout: "exec1", workout_date: 4.days.ago)
      @e2 = @john.exercises.create!(duration_in_min: 20, workout: "exec2", workout_date: 3.days.ago)
      visit '/'
      click_link "My Lounge"
    end

    scenario "shows user's workout for last 7 days" do
      expect(page).to have_content(@e1.duration_in_min)
      expect(page).to have_content(@e1.workout)
      expect(page).to have_content(@e1.workout_date)
      expect(page).to have_content(@e2.duration_in_min)
      expect(page).to have_content(@e2.workout)
      expect(page).to have_content(@e2.workout_date)

    end
end
