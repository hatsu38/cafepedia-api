json.main_shop @main_shop, partial: "api/v1/commons/main_shop", as: :main_shop
json.prefectures @prefectures, partial: "api/v1/commons/prefecture", as: :prefecture
json.stations @stations, partial: "api/v1/commons/station", as: :station
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.shop_total_count @shops&.total_count