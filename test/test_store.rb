require 'test/unit'
require_relative '../store'

class TestStore < Test::Unit::TestCase

  def setup
    sources = {:coupons_source => "test/data/coupons.csv", 
               :order_items_source => "test/data/order_items.csv",
               :orders_source => "test/data/orders.csv",
               :products_source => "test/data/products.csv"}
    @store = Store.new(sources)
  end

  def test_store_initialization
    assert_not_nil(@store)
    assert_equal(true, @store.orders.size == 6)
  end

  def test_calculate_orders
    @store.calculate_orders()
    
    order_3_total = @store.orders[2].total.to_f
    order_3_discount = @store.orders[2].discount.to_f
    
    assert_equal(order_3_total, 370.00)
    assert_equal(order_3_discount, 55.50)
    assert_equal(order_3_total - order_3_discount, 314.5)
  end
  
  def test_assign_items_to_orders
    assert_equal(true, @store.orders[1].items.size == 3)
  end
  
  def test_orders_totals
    @store.calculate_orders()
    
    order_0_total = @store.orders[0].total.to_f
    order_0_discount = @store.orders[0].discount.to_f
    assert_equal(order_0_total - order_0_discount, 2250)
    
    order_1_total = @store.orders[1].total.to_f
    order_1_discount = @store.orders[1].discount.to_f
    assert_equal(order_1_total - order_1_discount, 216.75)
    
    order_2_total = @store.orders[2].total.to_f
    order_2_discount = @store.orders[2].discount.to_f
    assert_equal(order_2_total - order_2_discount, 314.5)
    
    order_3_total = @store.orders[3].total.to_f
    order_3_discount = @store.orders[3].discount.to_f
    assert_equal(order_3_total - order_3_discount, 427.5)
    
    order_4_total = @store.orders[4].total.to_f
    order_4_discount = @store.orders[4].discount.to_f
    assert_equal(order_4_total - order_4_discount, 525)
    
    order_5_total = @store.orders[5].total.to_f
    order_5_discount = @store.orders[5].discount.to_f
    assert_equal(order_5_total - order_5_discount, 2227.5)
  end
  
end
