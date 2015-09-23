require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    movie_location = MovieLocation.new
    assert_not movie_location.valid?
    assert_equal [:movie, :location], movie_location.errors.keys
  end
end
