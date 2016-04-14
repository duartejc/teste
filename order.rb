class Order
  
  attr_reader :id, :coupon
  
  def initialize(id, coupon)
    @id = id
    @coupon = coupon
  end
end
