class wants < ApplicationRecord
    belongs_to :user
    validates :movie_id, uniqueness: { scope; user, message :"You already added this movie to the list"}
end 