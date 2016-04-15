require_relative 'product_repository'
require_relative 'coupon_repository'
require_relative 'order_repository'
require_relative 'order_item_repository'

class RepositoryFactory

  def self.build(object, source)
    case object
      when :product
        ProductRepository.new(source)
      when :coupon
        CouponRepository.new(source)
      when :order
        OrderRepository.new(source)
      when :order_item
        OrderItemRepository.new(source)
    end
  end
end
