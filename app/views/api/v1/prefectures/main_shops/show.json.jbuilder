json.prefecture @prefecture, partial: "api/v1/commons/prefecture", as: :prefecture
json.main_shop @main_shop, partial: "api/v1/commons/main_shop", as: :main_shop
json.stations @stations, partial: "api/v1/commons/station", as: :station
json.cities @cities, partial: "api/v1/commons/city", as: :city
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.shops_total_count @shops&.total_count