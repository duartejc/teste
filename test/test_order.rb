require 'test/unit'
require 'bigdecimal'
require_relative '../order'
require_relative '../repository_factory'

class TestOrder < Test::Unit::TestCase

  def setup
    order_repository = RepositoryFactory.build(:order, "test/data/orders.csv")
    @order = order_repository.find_by_id("234")

    product_repository = RepositoryFactory.build(:product, "test/data/products.csv")
    order_item_repository = RepositoryFactory.build(:order_item, "test/data/order_items.csv")
    order_items = order_item_repository.find_all_by_order(@order)

    order_items.map do |order_item|
      order_item.product = product_repository.find_by_id(order_item.product)
    end
    @order.items = order_items
  end

  def test_order_initialization
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    coupon = coupon_repository.find_by_id("123")
    order = Order.new(1, coupon)
    assert_not_nil(order)
    assert_equal(order.id, 1)
    assert_equal(order.coupon, coupon)
  end

  def test_order_total
    assert_equal(@order.total.to_f, 255.00)
  end

  def test_coupon_absolute_discount
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    @order.coupon = coupon_repository.find_by_id(@order.coupon)
    @order.items = []
    assert_equal(@order.discount.to_f, 25.00)
  end

  def test_coupon_percent_discount
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    @order.coupon = coupon_repository.find_by_id("234")
    assert_equal(@order.discount.to_f, 38.25)
  end

  def test_progressive_discount
    @order.coupon = nil
    assert_equal(@order.discount.to_f, 38.25)
  end
end
