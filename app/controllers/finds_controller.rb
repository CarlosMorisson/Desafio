class FindsController < ApplicationController
    
    def index
        @movie_name = params[:movie_name]

        @search = Tmdb::Search.new
        @search.resource('person') 
        @search.query(@movie_name) 
        
        @movie_finds = @search.fetch 
        
    end

end
