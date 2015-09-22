class CreateMovieActors < ActiveRecord::Migration
  def change
    create_table :movie_actors do |t|
      t.integer :movie_id, null: false
      t.integer :actor_id, null: false


      t.index :movie_id
      t.index :actor_id
    end
  end
end
