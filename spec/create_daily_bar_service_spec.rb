require './spec_helper'
require_relative '../src/create_daily_bar_service'

describe CreateDailyBarService do
  let(:prices) do 
    [
      ['銘柄コード', '時刻', '株価'],
      ['4436', '2021-3-10 09:00', 3605],
      ['4436', '2021-3-10 10:00', 3585],
      ['4436', '2021-3-10 11:00', 3505],
      ['4436', '2021-3-10 13:00', 3555],
      ['4436', '2021-3-10 14:00', 3655],
      ['4436', '2021-3-10 15:00', 3635]
    ]
  end

  subject(:daily_bar) { CreateDailyBarService.new(prices).call }

  it '日足が生成される' do
    expect(daily_bar.code).to eq('4436')
    expect(daily_bar.date).to eq(Date.new(2021,3,10))
    expect(daily_bar.open).to eq(3605)
    expect(daily_bar.high).to eq(3655)
    expect(daily_bar.low).to eq(3505)
    expect(daily_bar.close).to eq(3635)
    expect(daily_bar.white_candlestick?).to be(true)
  end
end