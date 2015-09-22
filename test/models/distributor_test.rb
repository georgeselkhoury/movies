require 'test_helper'

class DistributorTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    distributor = Distributor.new
    assert_not distributor.valid?
    assert_equal [:name], distributor.errors.keys
  end
end
