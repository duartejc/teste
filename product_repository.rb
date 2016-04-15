require_relative 'repository'
require_relative 'product'

class ProductRepository < Repository

  def all
    elements
      .reject {|elem| elem[0].nil?}
      .map { |elem| elem.take(2) }
      .map { |elem| Product.new *elem }
  end

  def find_by_id(id)
    all
      .find { |product| product.id == id }
  end
end
