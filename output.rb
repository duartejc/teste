require 'csv'

class Output
  
  def self.write(file, orders)
    CSV.open(file, "w") do |csv|
      orders.each do |order|
        order_total = order.total.to_f
        order_discount = order.discount.to_f
        csv << [order.id, order_total - order_discount]
      end
    end
  end
  
end
