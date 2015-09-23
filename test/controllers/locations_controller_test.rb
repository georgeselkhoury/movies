require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:address_one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should return all locations" do
    get :index, format: :json
    assert_response :success

    locations = assigns(:locations)

    assert_not_nil locations
    assert_equal(locations.length, 3)
  end

  test "should return SF locations only" do
    get :index, {latitude: 37.7833, longitude: -122.4167, format: :json}
    assert_response :success

    locations = assigns(:locations)

    assert_not_nil locations
    assert_equal(locations.length, 2)

    assert_includes(locations, locations(:address_one))
    assert_includes(locations, locations(:address_two))


  end

  test "should return Seattle locations only" do
    get :index, {latitude: 47.6097, longitude: -122.3331, format: :json}
    assert_response :success

    locations = assigns(:locations)

    assert_not_nil locations
    assert_equal(locations.length, 1)

    assert_includes(locations, locations(:address_three))
  end

  test "should show location" do
    get :show, {id: @location, format: :json}
    assert_response :success
  end
end
