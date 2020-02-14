require 'rails_helper'

RSpec.describe "As a User" do
  context "When I visit the studio index page" do
    before(:each) do 
        @studio_1 = Studio.create!(name: "Pixar")
        @studio_2 = Studio.create!(name: "Universal Pictures")
        @studio_3 = Studio.create!(name: "Lionsgate Films")

        # @movie_1 = @studio_1.create!(name: "Toy Story" , creation_year: 1995, genre: "Adventure" )
        # @movie_2 = @studio_2.create!(name: "Despicable Me" , creation_year: 2010, genre: "Family" )
        # @movie_3 = @studio_3.create!(name: "The Hunger Games" , creation_year: 2012, genre: "Thriller" )
    end 
    it "I see a list of all of the movie studios " do
        visits studios_path
        
        expect(page).to have_contents("Pixar")

        expect(page).to have_contents("Universal Pictures")

        expect(page).to have_contents("Lionsgate Films")
    end

    # it "underneath each studio, I see the names of all of its movies. " do 

    #   within("#studio-#{@studio_1.id}") do
    #     expect(page).to have_link("Toy Story")
    #   end

    #   within("#studio-#{@studio_2.id}") do
    #     expect(page).to have_link("Despicable Me")
    #   end

    #   within("#studio-#{@studio_3.id}") do
    #     expect(page).to have_link("The Hunger Games")
    #   end
    # end 
  end
end


# As a user, 
# When I visit the studio index page
# I see a list of all of the movie studios 
# And underneath each studio, I see the names of all of its movies.
