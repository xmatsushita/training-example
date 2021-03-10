class DailyBar
  attr_reader :code, :date, :open, :high, :low, :close

  def initialize(code:, date:, open:, high:, low:, close:)
    @code = code
    @date = date
    @open = open
    @high = high
    @low = low
    @close = close
  end

  def white_candlestick?
    @open < @close
  end
end
