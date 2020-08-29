json.main_shop @main_shop, partial: "api/v1/commons/main_shop", as: :main_shop
json.stations @stations, partial: "api/stations/station", as: :station
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.shop_total_count @shops&.total_count