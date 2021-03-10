require_relative './daily_bar'
require 'date'

class CreateDailyBarService

  def initialize(prices)
    @prices = prices
  end

  # @return [DailyBar]

  def call
    hash = @prices[1..-1].map {|n| Hash[@prices[0].zip(n)]}
    DailyBar.new(
      code: hash[0]['銘柄コード'],
      date: Date.parse(hash[0]['時刻']),
      open: hash.sort {|a,b| a['時刻'] <=> b['時刻']}[0]['株価'],
      high: hash.max {|x,y| x['株価'] <=> y['株価'] }['株価'],
      low: hash.min {|x,y| x['株価'] <=> y['株価'] }['株価'],
      close: hash.sort {|a,b| a['時刻'] <=> b['時刻']}.last['株価'])
  end
end
