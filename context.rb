class Context
  def initialize(strategy)
    extend(strategy)
  end
end
