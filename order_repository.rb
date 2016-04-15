require_relative 'repository'
require_relative 'order'

class OrderRepository < Repository

  def all
    elements
      .reject {|elem| elem[0].nil?}
      .map { |elem| elem.take(2) }
      .map { |elem| Order.new *elem }
  end

  def find_by_id(id)
    all
      .find { |order| order.id == id }
  end

end
