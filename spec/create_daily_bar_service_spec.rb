require './spec_helper'
require_relative '../src/create_daily_bar_service'

describe CreateDailyBarService do
  let(:prices) do 
    [
      ['銘柄コード', '時刻', '株価'],
      ['4436', '2021-3-10 10:00', 3585],
      ['4436', '2021-3-10 09:00', 3605],
      ['4436', '2021-3-10 11:00', 3505],
      ['4436', '2021-3-10 14:00', 3655],
      ['4436', '2021-3-10 15:00', 3635],
      ['4436', '2021-3-10 13:00', 3555]
    ]
  end

  subject(:daily_bar) { CreateDailyBarService.new(prices).call }

  it '銘柄コード' do
    expect(daily_bar.code).to eq('4436')
  end

  it '日付' do
    expect(daily_bar.date).to eq(Date.new(2021,3,10))
  end

  it '始値' do
    expect(daily_bar.open).to eq(3605)
  end

  it '高値' do
    expect(daily_bar.high).to eq(3655)
  end

  it '安値' do
    expect(daily_bar.low).to eq(3505)
  end

  it '終値' do
    expect(daily_bar.close).to eq(3635)
  end

  it '陽線ならば真' do
    expect(daily_bar.white_bar?).to be(true)
  end
end
