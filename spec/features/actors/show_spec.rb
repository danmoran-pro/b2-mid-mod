require "rails_helper"

describe "As a user" do
  describe "When I visit an actor's show page," do
    before(:each) do
        @actor_1 = Actor.create!(name: "Jennifer Lawrence", age: 29)

        @studio_1 = Studio.create!(name: "Lionsgate Films")
        @movie_1 = @studio_1.movies.create!(name: "The Hunger Games" , creation_year: 2012, genre: "Thriller" )
        @movie_2 = @studio_1.movies.create!(name: "The Hunger Games Catching Fire" , creation_year: 2013, genre: "Thriller" )
        @movie_3 = @studio_1.movies.create!(name: "The Hunger Games Mockingjay – Part 1" , creation_year: 2014, genre: "Thriller" )
       
        @actor_1.movies << @movie_1
        @actor_1.movies << @movie_2
        @actor_1.movies << @movie_3
    end

    it "I see their name, their age, and a list of the names of all of the movies they are in." do
        visit actor_path(@actor_1)

        expect(page).to have_content(@actor_1.name) 
        expect(page).to have_content(@actor_1.age)
    
        expect(page).to have_content(@movie_1.name)
        expect(page).to have_content(@movie_2.name)
        expect(page).to have_content(@movie_3.name)
    end
  end
end
