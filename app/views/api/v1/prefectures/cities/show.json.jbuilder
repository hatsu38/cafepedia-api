json.prefecture @prefecture, partial: "api/v1/prefectures/prefecture", as: :prefecture
json.city @city, partial: "api/v1/prefectures/cities/city", as: :city
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.total_count @shops&.total_count