class find_movies < ApplicationRecord
    belongs_to :User
    validates:movie_finds, uniqueness: {scope: : user,
message: "You already added this movie to the list"}
end