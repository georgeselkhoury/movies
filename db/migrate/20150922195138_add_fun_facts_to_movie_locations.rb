class AddFunFactsToMovieLocations < ActiveRecord::Migration
  def change
    add_column :locations, :fun_facts, :text
    remove_column :movies, :fun_facts, :text
  end
end
