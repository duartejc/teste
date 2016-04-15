require 'test/unit'
require_relative '../order_item'
require_relative '../repository_factory'

class TestOrderItem < Test::Unit::TestCase

  def test_order_item_initialization
    order_repository = RepositoryFactory.build(:order, "test/data/orders.csv")
    order = order_repository.find_by_id("234")
    product_repository = RepositoryFactory.build(:product, "test/data/products.csv")
    product = product_repository.find_by_id("345")
    order_item = OrderItem.new(order, product)
    assert_not_nil(order_item)
    assert_equal(order_item.order, order)
    assert_equal(order_item.product, product)
  end

end
