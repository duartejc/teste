require 'test/unit'
require_relative '../coupon'

class TestCoupon < Test::Unit::TestCase

  def test_coupon_initialization
    expiration_date = "2010/12/25"
    coupon = Coupon.new(1, 25, "percent", expiration_date, 1)
    assert_not_nil(coupon)
    assert_equal(coupon.id, 1)
    assert_equal(coupon.value, 25)
    assert_equal(coupon.expiration_date, Date.strptime(expiration_date, "%Y/%m/%d"))
  end

end
