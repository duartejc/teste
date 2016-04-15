require 'date'
require_relative 'repository_factory'

class Store
  
  attr_accessor :orders
  
  def initialize(args)
    @order_repository = RepositoryFactory.build(:order, args[:orders_source])
    @product_repository = RepositoryFactory.build(:product, args[:products_source])
    @order_item_repository = RepositoryFactory.build(:order_item, args[:order_items_source])
    @coupon_repository = RepositoryFactory.build(:coupon, args[:coupons_source])
    
    @orders = @order_repository.all
    assign_items_to_orders()
  end
  
  def calculate_orders
    false
  end
  
private

  def assign_items_to_orders
    order_item_repository = @order_item_repository
    product_repository = @product_repository
    coupon_repository = @coupon_repository
    
    orders.each do |order|
      order_items = order_item_repository.find_all_by_order(order)
      order_items.map do |order_item|
        order_item.product = product_repository.find_by_id(order_item.product)
      end
      order.items = order_items
      coupon = coupon_repository.find_by_id(order.coupon)
      order.coupon = (!coupon.nil? and coupon_valid?(coupon)) ? coupon : nil
    end
  end
  
  def coupon_valid?(coupon)
    times_used = orders
      .select { |order| order.coupon.instance_of?(Coupon) }
      .count { |order| order.coupon.id == coupon.id}
    (coupon.expiration_date >= Date.today) and (times_used < Integer(coupon.max_usage))
  end
end
