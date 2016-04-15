class OrderItem

  attr_reader :order
  attr_accessor :product

  def initialize(order, product)
    @order = order
    @product = product
  end
end
