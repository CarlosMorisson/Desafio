class find_moviesController < ApplicationController
    def index
        find_movies = current_user.find_movies
        @findmovies = []

        find_movies.each do |find_movies|
            movie = Tmdb::Movie.detail(find_movies.movie_finds)
            @findmovies.push(movie)
        end

        @findmovies

    end

    def create
        puts params[:movie_finds]
        current_user.find_movies.create(movie_finds: params [:movie_finds])

        redirect_to find_movies_path

    end

    def destroy
        current_user.find_movies.find_by(movie_finds: params [:id]).destroy

        redirect_to watchedmovies_path
    end
end