class FindedoviesController < ApplicationController
    def index
        finded_movies = current_user.finds_movies
        @findedmovies = []

        finds_movies.each do |finded_movies|
            movie = Tmdb::Movie.detail(finded_movies.movie_finds)
            @findedmovies.push(movie)
        end

        @findsmovies

    end

    def create
        puts params[:movie_finds]
        current_user.finds_movies.create(movie_code: params[:movie_code])

        redirect_to finded_movies_path

    end

    def destroy
        current_user.finded_movies.find_by(id: params[:id]).destroy

        redirect_to finded_movies_path
    end
end