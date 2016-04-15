require_relative 'repository'

class CouponRepository < Repository

  def all
    elements
      .reject {|elem| elem[0].nil?}
      .map { |elem| elem.take(5) }
      .map { |elem| Coupon.new *elem }
  end

  def find_by_id(id)
    all
      .find { |coupon| coupon.id == id }
  end
end
