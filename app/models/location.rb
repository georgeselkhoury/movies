class Location < ActiveRecord::Base
  validates :address, :latitude, :longitude, presence: true

  has_many :movie_locations
  has_many :movies, through: :movie_locations

  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
