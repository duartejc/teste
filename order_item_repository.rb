require_relative 'repository'

class OrderItemRepository < Repository

  def all
    elements
      .reject { |elem| elem[0].nil? }
      .map { |elem| elem.take(2) }
      .map { |elem| OrderItem.new *elem }
  end

  def find_all_by_order(order)
    all
      .select { |order_item| order_item.order == order.id }
  end

end
