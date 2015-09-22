require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    location = Location.new
    assert_not location.valid?
    assert_equal [:address, :latitude, :longitude], location.errors.keys
  end
end
