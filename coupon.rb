class Coupon
  
  attr_reader :id, :value, :type, :expiration_date, :max_usage
  
  def initialize(id, value, type, expiration_date, max_usage)
    @id = id
    @value = value
    @type = type
    @expiration_date = expiration_date
    @max_usage = max_usage
  end
end
