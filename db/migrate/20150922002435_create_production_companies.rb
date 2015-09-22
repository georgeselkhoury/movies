class CreateProductionCompanies < ActiveRecord::Migration
  def change
    create_table :production_companies do |t|
      t.string :name, null: false

      t.timestamps null: false

      t.index :name

    end
  end
end
