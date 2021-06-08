class FindedMovie < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :movie_code
end
