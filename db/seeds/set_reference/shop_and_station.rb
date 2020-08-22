
Shop.access_station("駅").each do |shop|
  station_names = shop.access.match(/.*?駅/)
  next if station_names.nil?

  station = Station.find_by(kanji_name: station_names[0])
  next if station.nil?

  ShopStation.find_or_create_by!(
    shop_id: shop.id,
    station_id: station.id
  )
end