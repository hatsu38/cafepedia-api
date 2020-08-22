namespace :data_mainttenance do
  desc "市区町村と都道府県,ショップと紐付け"
  task set_city_references: :environment do
    require 'open-uri'
    Prefecture.all.each do |prefecture|
      cities = get_cities_json(prefecture)
      cities.each do |city|
        finded_city = City.find_by(code: city["cityCode"])
        if finded_city.nil?
          finded_city = City.find_or_create_by!(name: city["cityName"], code: city["cityCode"], prefecture_id: prefecture.id)
        else
          finded_city.update!(name: city["cityName"], prefecture_id: prefecture.id)
        end
        puts finded_city.name
        Shop.where(prefecture_id: prefecture.id)
            .where(city_name: finded_city.name)
            .update(city_id: finded_city.id)
      end
    end
  end

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
      sleep(10)
      count += 1
      get_cities_json(prefecture)
    end
  end
end

