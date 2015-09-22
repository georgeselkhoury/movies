class MovieActor < ActiveRecord::Base
  validates :movie, :actor, presence:true

  belongs_to :movie
  belongs_to :actor
end
