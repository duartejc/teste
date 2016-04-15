require 'test/unit'
require_relative '../repository'
require_relative '../file_not_found_exception'

class TestRepository < Test::Unit::TestCase

  def test_read_product_source_csv
    product_repository = RepositoryFactory.build(:product, "test/data/products.csv")
    assert_not_nil(product_repository.all)
    assert_equal(true, product_repository.all.size == 10)
  end

  def test_read_coupon_source_csv
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    assert_not_nil(coupon_repository.all)
    assert_equal(true, coupon_repository.all.size == 5)
  end

  def test_read_order_source_csv
    order_repository = RepositoryFactory.build(:order, "test/data/orders.csv")
    assert_not_nil(order_repository.all)
    assert_equal(true, order_repository.all.size == 6)
  end

  def test_read_order_item_source_csv
    order_item_repository = RepositoryFactory.build(:order_item, "test/data/order_items.csv")
    assert_not_nil(order_item_repository.all)
    assert_equal(true, order_item_repository.all.size == 17)
  end

  def test_raise_file_not_found
    assert_raise FileNotFoundException do
      product_repository = RepositoryFactory.build(:product, "missing_file.csv")
      product_repository.load_from_source()
    end
  end

  def test_find_coupon_by_id
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    coupon = coupon_repository.find_by_id("123")
    assert_not_nil(coupon)
    assert_equal(true, coupon.id == "123")
  end

end
