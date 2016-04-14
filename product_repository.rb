require_relative 'repository'

class ProductRepository < Repository
    
  def all
    elements
      .reject {|elem| elem[0].nil?}
      .map { |elem| elem.take(2) }
      .map { |elem| Product.new *elem }
  end
end
