require 'test_helper'

class ProductionCompanyTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    production_company = ProductionCompany.new
    assert_not production_company.valid?
    assert_equal [:name], production_company.errors.keys
  end
end
