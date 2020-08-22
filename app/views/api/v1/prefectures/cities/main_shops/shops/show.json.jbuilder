json.prefecture @prefecture, partial: "api/v1/commons/prefecture", as: :prefecture
json.city @city, partial: "api/v1/commons/city", as: :city
json.main_shop @main_shop, partial: "api/v1/commons/main_shop", as: :main_shop
json.shop @shop, partial: "api/v1/commons/shop", as: :shop
json.total_count @shops&.total_count