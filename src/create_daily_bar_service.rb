class CreateDailyBarService
  # @return [DailyBar]
  def initialize(prices)
    @prices = prices
  end

  def call
    DailyBar.new(code: @prices[1][0], high: high)
  end

  def high
    highs = @prices.map do |price|
      price[2]
    end
    highs.shift
    highs.max
  end
end
