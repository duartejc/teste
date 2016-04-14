require 'test/unit'
require_relative '../order'
require_relative '../repository_factory'

class TestOrder < Test::Unit::TestCase
 
  def test_order_initialization
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    coupon = coupon_repository.find_by_id("123")
    order = Order.new(1, coupon)
    assert_not_nil(order)
    assert_equal(order.id, 1)
    assert_equal(order.coupon, coupon)
  end
 
end
