json.prefecture @prefecture, partial: "api/v1/commons/prefecture", as: :prefecture
json.cities @cities, partial: "api/v1/commons/city", as: :city
json.main_shops @main_shops, partial: "api/v1/commons/main_shop", as: :main_shop
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.shops_total_count @shops&.total_count