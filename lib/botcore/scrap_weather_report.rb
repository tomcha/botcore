require 'net/http'

module Botcore
  class ScrapWeatherReport
    def initialize(*place_name)

    @tenki_jp_place_data = {
      sapporo:  '1/2/1400',
      hakodate: '1/4/2300',
      yokohama: '3/17/4610',
      tokyo:    '3/16/4410',
      nagoya:   '5/26/5110',
      tsu:      '5/27/5310',
      osaka:    '6/30/6200',
      kobe:     '6/31/6310',
      kyoto:    '6/29/6110',
      fukuoka:  '9/43/8210',
      ooita:    '9/47/8310',
      nagasaki: '9/45/8410',
      naha:     '10/50/9110',
    }

      if(place_name.size >0)
        pn = place_name[0].to_sym
        if (@tenki_jp_place_data[pn] != nil)
          @targeturl = "http://www.tenki.jp/indexes/umbrella/#{@tenki_jp_place_data[pn]}.html"
        else
          @targeturl = nil
        end
      else
        #近畿地方 大阪府のデータ
        @targeturl = 'http://www.tenki.jp/indexes/umbrella/6/30/6200.html'
      end
    end

    def get_umbrella_data
      uri = URI.parse(@targeturl)
      res = Net::HTTP.get(uri)
      res.force_encoding("utf-8")
      res =~ /<dl id="exponentLargeLeft">(.+?)<\/dl>/m
      today_html = $1
      today_html =~ /alt="指数:(.+?):(.+?)"/
      @today_rainypercent = $1
      @today_umbrella_advice = $2

      res =~ /<dl id="exponentLargeRight">(.+?)<\/dl>/m
      tomorrow_html = $1
      tomorrow_html =~ /alt="指数:(.+?):(.+?)"/
      @tomorrow_rainypercent = $1
      @tomorrow_umbrella_advice = $2

      umbrella_data = {today_rainypercent: @today_rainypercent,
                       today_umbrella_advice: @today_umbrella_advice,
                       tomorrow_rainypercent: @tomorrow_rainypercent,
                       tomorrow_umbrella_advice: @tomorrow_umbrella_advice}
      return umbrella_data
    end
  end
end

__END__
