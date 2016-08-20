require 'botcore/todofuken'
require 'net/http'
require 'uri'
require 'openssl'
require 'json'

module Botcore
  class SakenoteApi
    @apitoken
    def initialize
      File.open('config.txt') do |f|
        f.each_line do |txt|
          if txt =~ /sakenote_apitoken:(.+)/
            @apitoken = $1
          end
        end
      end
    end

    def loaded_apitoken?
      @apitoken ? true : false
    end

    def invest_maker(place)
      sake_list = Hash.new
      if place =~ /(.+)(都|道|府|県)/
        place = $1
      end
      tf = Botcore::Todofuken.new
      prefecture_code = tf.get_fukennum(place)
      url_text = 'https://www.sakenote.com/api/v1/sakes'
      uri = URI.parse(url_text)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      options = {
        token:            @apitoken,
        prefecture_code:  prefecture_code,
        page:             0,
      }.select{ |k, v| !v.nil? }
      begin
        options[:page] += 1
        req = Net::HTTP::Get.new(uri.request_uri, initheader = { 'Content-Type' => 'application/json' })
        req.body = options.to_json
        res = http.request(req)
        body = JSON.parse(res.body)
        sakes = body["sakes"]
        sakes.each do |s|
          sake_list[s["sake_name"]] = s["maker_name"]
        end
        puts options[:page]
      end while options[:page] < body["num_pages"]
      sake_list
    end
  end
end
