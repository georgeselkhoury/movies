class Location < ActiveRecord::Base
  validates :address, presence: true

  has_many :movie_locations
  has_many :movies, through: :movie_locations

  geocoded_by :address, if: ->(obj){ obj.address.present? and obj.address_changed? and (obj.latitude.nil? || obj.longitude.nil?) }
  after_validation :geocode
end
