class Location < ActiveRecord::Base
  validates :address, :latitude, :longitude, presence: true

  has_many :movie_locations
  has_many :movies, through: :movie_locations


  geocoded_by :address, if: ->(obj){ obj.address.present? and obj.address_changed? and (obj.latitude == 0 || obj.longitude == 0) }
  after_validation :geocode

  before_validation :set_defaults

  def set_defaults
    self.latitude = 0 if self.latitude.nil?
    self.longitude = 0 if self.longitude.nil?
  end


end
