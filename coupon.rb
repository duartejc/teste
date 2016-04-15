require 'date'

class Coupon

  attr_reader :id, :value, :type, :expiration_date, :max_usage

  def initialize(id, value, type, expiration_date, max_usage)
    @id = id
    @value = value
    @type = type
    @expiration_date = Date.strptime(expiration_date,"%Y/%m/%d")
    @max_usage = max_usage
  end

  def is_absolute?
    self.type == "absolute"
  end
end
