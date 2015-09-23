class ChangeLatitudeLongitudeToLocations < ActiveRecord::Migration
  def change
    change_column_null :locations, :latitude, null: true
    change_column_null :locations, :longitude, null: true
  end
end
