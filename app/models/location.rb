class Location < ActiveRecord::Base
  validates :address, :latitude, :longitude, presence: true

  has_many :movie_locations
  has_many :movies, through: :movie_locations
end
