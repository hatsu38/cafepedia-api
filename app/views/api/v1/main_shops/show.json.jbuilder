json.main_shop @main_shop, partial: "api/v1/commons/main_shop", as: :main_shop
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.total_count @shops&.total_count