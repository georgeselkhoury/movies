require 'test_helper'

class MovieActorTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    movie_actor = MovieActor.new
    assert_not movie_actor.valid?
    assert_equal [:movie_id, :actor_id], movie_actor.errors.keys
  end
end
