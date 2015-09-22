class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :release_year, null: false
      t.text :fun_facts
      t.integer :director_id
      t.integer :distributor_id
      t.integer :production_company_id
      t.integer :writer_id

      t.timestamps null: false

      t.index :title
      t.index :director_id
      t.index :distributor_id
      t.index :production_company_id
      t.index :writer_id
    end
  end
end
