require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    director = Director.new
    assert_not director.valid?
    assert_equal [:full_name], director.errors.keys
  end
end
