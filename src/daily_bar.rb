class DailyBar
  attr_reader :code
  attr_reader :high

  def initialize(params)
    @code = params[:code]
    @high = params[:high]
  end

end
