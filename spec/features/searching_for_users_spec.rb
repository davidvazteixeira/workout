require 'rails_helper'

RSpec.feature "Search for User" do
  
    before do
      names = ["John", "Carla"]
      surnames = ["Nash", "Stone"]

      @users = []
      names.map do |fn|
        surnames.map do |ln|
          @users.push User.create!(first_name: fn ,last_name: ln, email: "#{fn}#{ln}@mail.com", password:"password")
        end
      end

      login_as(User.where(email: "johnnash@mail.com").first)


      visit "/"
    end

    scenario "with existing name returns all those users" do
      fill_in "search_name", with: "Stone"
      click_button "Search"

      expect(page.current_path).to eq("/dashboard/search")
      @users.select{|u| u.last_name.include? "Stone"}.each do|u|
        expect(page).to have_content(u.full_name)
      end
    end

end
