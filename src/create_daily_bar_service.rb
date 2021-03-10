require_relative './daily_bar'
require 'date'

class CreateDailyBarService

  def initialize(prices)
    @prices = prices
  end

  # @return [DailyBar]

  def call
    @prices.delete_at(0)
    DailyBar.new(
      code: @prices[1][0],
      date: Date.parse(@prices[1][1]),
      open: @prices.sort {|a,b| a[1] <=> b[1]}[0][2],
      high: @prices.max {|x,y| x[2] <=> y[2] }[2],
      low: @prices.min {|x,y| x[2] <=> y[2] }[2],
      close: @prices.sort {|a,b| a[1] <=> b[1]}.last[2])
  end
end
