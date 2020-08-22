def self.get_near_stations_json(station_name)
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

Station.all.find_each do |station|
  station_name = station.kanji_name.last == "駅" ? station.kanji_name.chop : station.kanji_name
  near_stations_json = get_near_stations_json(station_name)
  next unless near_stations_json

  near_station_names = near_stations_json.pluck("prev","next").flatten.compact.uniq
  near_station_names.each do |near_station_name|
    near_station = Station.find_by(kanji_name: "#{near_station_name}駅") || Station.find_by(kanji_name: near_station_name)
    next if near_station.nil?
    puts near_station.kanji_name
    NearStationRelationship.find_or_create_by!(
      main_station_id: station.id,
      near_station_id: near_station.id
    )
  end
  sleep(0.5)
end
