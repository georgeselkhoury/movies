class Writer < ActiveRecord::Base
  validates :full_name, presence: true

  has_many :movies
end
