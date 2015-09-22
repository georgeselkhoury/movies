require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    actor = Actor.new
    assert_not actor.valid?
    assert_equal [:full_name], actor.errors.keys
  end
end
