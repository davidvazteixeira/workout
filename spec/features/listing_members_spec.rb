require 'rails_helper'

RSpec.feature "Listing members" do
  
    before do
      @users_count = 5
      @users = []
      @users_count.times do |n|
        @users.push User.create!(first_name: "u#{n}fn",last_name: "u#{n}ln",email: "u#{n}@mail.com", password:"password")
      end
      visit "/"
    end

    scenario "shows a list of registered members" do
      expect(page).to have_content("List of Members")
      @users.each do |u|
        expect(page).to have_content(u.full_name)
      end
    end
end
