class MovieLocation < ActiveRecord::Base
  validates :movie_id, :location_id, presence: true

  belongs_to :movie
  belongs_to :location
end
