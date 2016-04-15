require 'test/unit'
require_relative '../product'

class TestProduct < Test::Unit::TestCase

  def test_product_initialization
    product = Product.new(1, 50.0)
    assert_not_nil(product)
    assert_equal(product.id, 1)
    assert_equal(product.value, 50.0)
  end

end
