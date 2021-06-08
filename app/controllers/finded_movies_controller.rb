class FindsmoviesController < ApplicationController
    def index
        finds_movies = current_user.finds_movies
        @findedmovies = []

        finds_movies.each do |finds_movies|
            movie = Tmdb::Movie.detail(finds_movies.movie_finds)
            @findedmovies.push(movie)
        end

        @findedmovies

    end

    def create
        puts params[:movie_finds]
        current_user.finded_movies.create(movie_finds: params [:movie_finds])

        redirect_to finded_movies_path

    end

    def destroy
        current_user.finded_movies.find_by(movie_finds: params [:id]).destroy

        redirect_to finded_movies_path
    end
end