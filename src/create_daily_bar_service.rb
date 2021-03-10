require_relative './daily_bar'

class CreateDailyBarService

  def initialize(prices)
    @prices = prices
  end

  # @return [DailyBar]

  def call
    DailyBar.new(
      code: @prices[1][0],
      date: @prices[2][1],
      open: @prices[1][2],
      high: @prices[3].max,
      low: @prices[3].min,
      close: @prices.last[2])
  end
end
