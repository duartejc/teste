require_relative 'product_repository'
require_relative 'coupon_repository'

class RepositoryFactory
  
  def self.build(object, source)
    case object
      when :product
        ProductRepository.new(source)
      when :coupon
        CouponRepository.new(source)  
    end
  end
end
