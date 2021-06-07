class WantsController < ApplicationController
   
    def index
        wants = current_user.wants
        @movies = []

        wants.each do |want|
            movie = Tmdb::Movie.details(want.movie_finds)
            @movies.push(movie)
        end

        @movies
    end
    def create
        puts params [:movie_finds]
        current_user.wants.create(movie_finds:params[:movie_finds])

        redirect-to wants_path
    end
    def destroy
        current_user.wants.find_by(movie_finds: params[:id]).destroy

        redirect_to wants_path
    end
end