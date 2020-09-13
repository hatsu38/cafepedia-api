def get_stations_json(station_name)
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
    get_stations_json(station_name)
  end
end

stations = Station.where(latitude: 0, longitude: 0)

if stations
  stations_attribute = stations.each do |station|
    station_name = station.eki_except_from_kanji_name
    get_stations = get_stations_json(station_name)
    next unless get_stations
    puts station_name
    station.update(
      latitude: get_stations.first["x"].to_i,
      longitude: get_stations.first["y"].to_i,
    )
  end
end