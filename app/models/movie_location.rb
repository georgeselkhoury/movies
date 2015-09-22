class MovieLocation < ActiveRecord::Base
  validates :movie, :location, presence: true

  belongs_to :movie
  belongs_to :location
end
