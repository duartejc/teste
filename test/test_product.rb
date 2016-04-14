require 'test/unit'
require_relative '../product'

class TestProduct < Test::Unit::TestCase
 
  def test_product_initialization
    product = Product.new(1, "Teste")
    assert_not_nil(product)
    assert_equal(product.id, 1)
    assert_equal(product.name, "Teste")
  end
 
end
