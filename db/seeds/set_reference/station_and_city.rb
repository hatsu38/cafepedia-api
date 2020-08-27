def get_near_stations_json(station_name)
  count = 0
  uri = URI("https://express.heartrails.com/api/json")
  params = { method: "getStations", name: station_name }
  uri.query = URI.encode_www_form(params)
  begin
    response = Net::HTTP.get_response(uri)
    response.is_a?(Net::HTTPSuccess) ? JSON.parse(response.body)["response"]["station"] : nil
  rescue => error
    return nil if count > 3
    sleep(10)
    count += 1
    get_near_stations_json(station_name)
  end
end

def get_city_name(postalcode)
  count = 0
  uri = URI("https://zipcloud.ibsnet.co.jp/api/search")
  params = { zipcode: postalcode }
  uri.query = URI.encode_www_form(params)
  begin
    response = Net::HTTP.get_response(uri)
    response.is_a?(Net::HTTPSuccess) && JSON.parse(response.body)["results"] ? JSON.parse(response.body)["results"][0] : nil
  rescue => error
    return nil if count > 3
    sleep(10)
    count += 1
    get_city_name(postalcode)
  end
end

# 最も多くでた郵便番号の市区町村を取得
# 最も多くでた郵便番号の市区町村がCityテーブルになければ、Cityテーブルに存在する市区町村名を探す
# それもなければ、city_idはnilとする
def most_match_city(postalcodes)
  # 郵便番号の多い順にソート
  postalcodes.group_by{|e| e}.sort_by{|_,v|-v.size}.map(&:first)
  city = nil
  prefecture = Prefecture.find_by_id(48)
  postalcodes.each do |postalcode|
    city_info = get_city_name(postalcode)
    next unless city_info

    prefecture_name = city_info["address1"]
    city_name = city_info["address2"]
    prefecture = Prefecture.find_by_name(prefecture_name)
    city = City.find_by(name: city_name)
    break if city.present? && prefecture.present?
  end
  [city, prefecture]
end

stations = Station.where(city_id: nil).or(Station.where(prefecture_id: 48))

if stations.present?
  stations.find_each do |station|
    station_name = station.kanji_name.last == "駅" ? station.kanji_name.chop : station.kanji_name
    near_stations_json = get_near_stations_json(station_name)
    next unless near_stations_json

    postalcodes = near_stations_json.pluck("postal").flatten.compact
    city, prefecture = most_match_city(postalcodes)
    puts "駅名：#{station_name}"
    puts "都道府県：#{prefecture&.name}"
    puts "市区町村：#{city&.name}"
    begin
      station.update!(
        prefecture_id: prefecture.id,
        city_id: city&.id
      )
    rescue => error
      Raven.extra_context(error)
    end
  end
end