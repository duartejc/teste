require 'test/unit'
require_relative '../repository_factory'

class TestRepositoryFactory < Test::Unit::TestCase
 
  def test_build_product_repository
    product_repository = RepositoryFactory.build(:product, "test/data/products.csv")
    assert_not_nil(product_repository)
  end
  
  def test_build_coupon_repository
    coupon_repository = RepositoryFactory.build(:coupon, "test/data/coupons.csv")
    assert_not_nil(coupon_repository)
  end
  
end
