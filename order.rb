require 'bigdecimal'

class Order

  attr_reader :id
  attr_accessor :items, :coupon

  def initialize(id, coupon)
    @id = id
    @coupon = coupon
  end

  def total
    items
      .map{ |item| BigDecimal.new(item.product.value, 2) }
      .reduce(0, :+)
  end

  def discount
    unless coupon.nil?
      coupon_discount = coupon.is_absolute? ? coupon.value : total * (BigDecimal.new(coupon.value, 2) / 100)
    end

    progressive_discount_percentage = items.size >= 2 ? (items.size > 8 ? 8 : items.size) * 0.05 : 0
    progressive_discount = total * progressive_discount_percentage

    [coupon_discount.to_f, progressive_discount.to_f].max
  end
end
