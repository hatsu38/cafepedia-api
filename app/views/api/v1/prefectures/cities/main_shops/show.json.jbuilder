json.prefecture @prefecture, partial: "api/v1/commons/prefecture", as: :prefecture
json.city @city, partial: "api/v1/commons/city", as: :city
json.cities @cities, partial: "api/v1/commons/city", as: :city
json.stations @stations, partial: "api/v1/commons/station", as: :station
json.main_shop @main_shop, partial: "api/v1/commons/main_shop", as: :main_shop
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.shop_total_count @shops&.total_count