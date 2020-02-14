require 'rails_helper'

RSpec.describe "As a User" do
  context "When I visit the studio index page" do
    before(:each) do 
        @studio_1 = Studio.create!(name: "Pixar")
        @studio_2 = Studio.create!(name: "Universal Pictures")
        @studio_3 = Studio.create!(name: "Lionsgate Films")

        @movie_1 = @studio_1.movies.create!(name: "Toy Story" , creation_year: 1995, genre: "Adventure" )
        @movie_2 = @studio_2.movies.create!(name: "Despicable Me" , creation_year: 2010, genre: "Family" )
        @movie_3 = @studio_3.movies.create!(name: "The Hunger Games" , creation_year: 2012, genre: "Thriller" )
    end 
    it "I see a list of all of the movie studios " do
        visit studios_path
        
        expect(page).to have_content("Pixar")

        expect(page).to have_content("Universal Pictures")

        expect(page).to have_content("Lionsgate Films")
    end

   it "underneath each studio, I see the names of all of its movies. " do
      visit studios_path

      within "#studio-#{@studio_1.id}" do
        within "#movies" do
          expect(page).to have_content("Toy Story")
      end
    end

      within "#studio-#{@studio_2.id}" do
        within "#movies" do
          expect(page).to have_content("Despicable Me")
        end
      end

      within("#studio-#{@studio_3.id}") do
        within "#movies" do
          expect(page).to have_content("The Hunger Games")
        end 
      end
    end 
  end
end

