class FindsController < ApplicationController
    def index
        @movie_name = params[:movie_name]

        @search = Tmdb::Search.new
        @search.resource('person') # determines type of resource
        @search.query(@movie_name) # the query to search against
        
        @movie_finds = @search.fetch # makes request
        
    end

end
