require 'spec_helper'
require 'botcore/scrap_weather_report'

describe "ScrapWeatherReport" do
  describe "地域を指定しない時、大阪のデータを調べる" do

    before do
      @app ||= Botcore::ScrapWeatherReport.new
    end

    it '今日と明日の降水確率と傘の必要性がハッシュで返ってくる' do
      result = @app.get_umbrella_data
      expect(result[:today_rainypercent]).to match(/^\d+$/)
      expect(result[:today_umbrella_advice]).to be_truthy
      expect(result[:tomorrow_rainypercent]).to match(/^\d+$/)
      expect(result[:tomorrow_umbrella_advice]).to be_truthy
    end
  end

  describe "地域を指定した時" do

    before do
      @app ||= Botcore::ScrapWeatherReport.new('yokohama')
    end

    it '今日と明日の降水確率と傘の必要性がハッシュで返ってくる' do
      result = @app.get_umbrella_data
      expect(result[:today_rainypercent]).to match(/^\d+$/)
      expect(result[:today_umbrella_advice]).to be_truthy
      expect(result[:tomorrow_rainypercent]).to match(/^\d+$/)
      expect(result[:tomorrow_umbrella_advice]).to be_truthy
    end
  end
end
