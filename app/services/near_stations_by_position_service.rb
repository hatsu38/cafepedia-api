class NearStationsByPositionService
  def execute(latitude, longitude)
    stations = get_near_stations_json(latitude, longitude)
    return nil unless stations

    station_names = stations.map {|station| station['name']}
    station_names += station_names.map {|station| "#{station}駅" }
    Station.where(kanji_name: station_names)
  end

  private

  def get_near_stations_json(latitude, longitude, count = 0)
    uri = URI('https://express.heartrails.com/api/json')
    params = { method: 'getStations', x: longitude, y: latitude }
    uri.query = URI.encode_www_form(params)
    begin
      response = Net::HTTP.get_response(uri)
      response.is_a?(Net::HTTPSuccess) ? JSON.parse(response.body)['response']['station'] : nil
    rescue StandardError
      return nil if count > 3

      sleep(1)
      count += 1
      get_near_stations_json(latitude, longitude, count)
    end
  end
end
