class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :full_name, null: false

      t.timestamps null: false

      t.index :full_name
    end
  end
end
