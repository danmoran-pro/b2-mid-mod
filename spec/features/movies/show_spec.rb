require "rails_helper"

describe "As a user" do
  describe "When I visit an movies's show page," do
    before(:each) do
        @studio_1 = Studio.create!(name: "Lionsgate Films")
        @movie_1 = @studio_1.movies.create!(name: "The Hunger Games" , creation_year: 2012, genre: "Thriller" )

        @actor_1 = Actor.create!(name: "Jennifer Lawrence", age: 29)
        @actor_2 = Actor.create!(name: "Josh Hutcherson", age: 27)
        @actor_3 = Actor.create!(name: "Liam Hemsworth", age: 30)

        @movie_1.actors << @actor_1
        @movie_1.actors << @actor_2
        @movie_1.actors << @actor_3
    end 

    it "can see the movie's name, creation year, and genre and all the actors from youngest to olders" do
        visit movie_path(@movie_1)

        expect(page).to have_content(@movie_1.name)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)
save_and_open_page
        expect(page).to have_content(@actor_2.name)
        expect(page).to have_content(@actor_1.name)
        expect(page).to have_content(@actor_3.name)
    end 
  end 
end 



# As a user, 
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre, 
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors 