class CreateDistributors < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
      t.string :name, null: false

      t.timestamps null: false

      t.index :name
    end
  end
end
