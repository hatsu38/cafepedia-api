class NearCityByPositionService
  # 参考: https://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/placeinfo.html
  def execute(latitude, longitude)
    city_code = get_city_code_json(latitude, longitude)
    return nil unless city_code

    City.find_by(code: city_code)
  end

  private

  # https://map.yahooapis.jp/placeinfo/V1/get?lat=139.730&lon=35.665&appid=dj00aiZpPTM3RXQ1eDQzbUFjeCZzPWNvbnN1bWVyc2VjcmV0Jng9MDQ-&output=json
  # https://map.yahooapis.jp/placeinfo/V1/get?lat=35.66521320007564&lon=139.7300114513391&appid=dj00aiZpPTM3RXQ1eDQzbUFjeCZzPWNvbnN1bWVyc2VjcmV0Jng9MDQ-&output=json
  def get_city_code_json(latitude, longitude)
    count = 0
    uri = URI('https://map.yahooapis.jp/placeinfo/V1/get')
    params = { lat: latitude, lon: longitude, appid: Rails.application.credentials.yahoo_client_id, output: 'json' }
    uri.query = URI.encode_www_form(params)
    begin
      response = Net::HTTP.get_response(uri)
      response.is_a?(Net::HTTPSuccess) ? JSON.parse(response.body)['ResultSet']['Govcode'] : nil
    rescue StandardError => e
      return nil if count > 3

      sleep(1)
      count += 1
      get_city_code_json(latitude, longitude)
    end
  end
end
