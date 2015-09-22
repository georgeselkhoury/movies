class CreateMovieLocations < ActiveRecord::Migration
  def change
    create_table :movie_locations do |t|
      t.integer :movie_id, null: false
      t.integer :location_id, null: false

      t.timestamps null: false

      t.index :movie_id
      t.index :location_id
    end
  end
end
