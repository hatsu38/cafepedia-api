def get_cities_json(prefecture)
  count = 0
  base_url = "https://opendata.resas-portal.go.jp/api/v1/cities?"
  params = { prefCode: prefecture.id }
  url = base_url + URI.encode_www_form(params)
  headers = { "X-API-KEY" => Rails.application.credentials.x_api_key }

  begin
    res = open(url, headers)
    res.status.include?("200") ? JSON.parse(res.read)["result"] : nil
  rescue => error
    return nil if count > 3
    sleep(5)
    count += 1
    get_cities_json(prefecture)
  end
end

Prefecture.all.each do |prefecture|
  cities = get_cities_json(prefecture)
  cities.each do |city|
    if City.find_by(code: city["cityCode"]).nil?
      City.find_or_create_by!(name: city["cityName"], code: city["cityCode"], prefecture_id: prefecture.id)
    end
  end
end
