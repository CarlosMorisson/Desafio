class finds_moviesController < ApplicationController
    def index
        finds_movies = current_user.finds_movies
        @findsmovies = []

        finds_movies.each do |finds_movies|
            movie = Tmdb::Movie.detail(finds_movies.movie_finds)
            @findsmovies.push(movie)
        end

        @findsmovies

    end

    def create
        puts params[:movie_finds]
        current_user.finds_movies.create(movie_finds: params [:movie_finds])

        redirect_to finds_movies_path

    end

    def destroy
        current_user.finds_movies.find_by(movie_finds: params [:id]).destroy

        redirect_to finds_movies_path
    end
end