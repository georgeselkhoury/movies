class Actor < ActiveRecord::Base
  validates :full_name, presence: true

  has_many :movie_actors
  has_many :movies, through: :movie_actors
end
