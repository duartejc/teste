require_relative 'repository'

class CouponRepository < Repository
    
  def all
    elements
      .reject {|elem| elem[0].nil?}
      .map { |elem| elem.take(5) }
      .map { |elem| Coupon.new *elem }
  end
end
