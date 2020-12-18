class NearCityByPositionService
  # Ref: https://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/placeinfo.html
  def execute(latitude, longitude)
    city_code = get_city_code_json(latitude, longitude)
    return nil unless city_code || City.exists(code: city_code)

    City.find_by!(code: city_code)
  end

  private

  def get_city_code_json(latitude, longitude, count = 0)
    uri = URI('https://map.yahooapis.jp/placeinfo/V1/get')
    params = { lat: latitude, lon: longitude, appid: Rails.application.credentials.yahoo_client_id, output: 'json' }
    uri.query = URI.encode_www_form(params)
    begin
      response = Net::HTTP.get_response(uri)
      response.is_a?(Net::HTTPSuccess) ? JSON.parse(response.body)['ResultSet']['Govcode'] : nil
    rescue StandardError
      return nil if count > 3

      count += 1
      sleep(1)
      get_city_code_json(latitude, longitude, count)
    end
  end
end
