class CreateFindedMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :finded_movies do |t|
      t.integer :movie_code
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
