require 'test_helper'

class WriterTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    writer = Writer.new
    assert_not writer.valid?
    assert_equal [:full_name], writer.errors.keys
  end
end
