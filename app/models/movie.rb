class Movie < ActiveRecord::Base
  validates :title, :release_year, presence: true

  belongs_to :director
  belongs_to :distributor
  belongs_to :production_company
  belongs_to :writer

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  has_many :movie_locations
  has_many :locations, through: :movie_locations
end
