class FindedMoviesController < ApplicationController
    def index
        finded_movies = current_user.finded_movies
        @findedmovies = []

        finded_movies.each do |finded_movie|
            movie = Tmdb::Movie.detail(finded_movie.movie_code)
            @findedmovies.push(movie)
        end

        @findedmovies

    end

    def create
        puts params[:movie_code]
        current_user.finded_movies.create(movie_code: params[:movie_code])

        redirect_to finded_movies_path

    end

    def destroy
         current_user.finded_movies.find_by(movie_code: params[:id]).destroy

        redirect_to finded_movies_path
    end
end