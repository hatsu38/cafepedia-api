json.prefecture @prefecture, partial: "api/v1/commons/prefecture", as: :prefecture
json.cities @cities, partial: "api/v1/commons/city", as: :city
json.shops @shops, partial: "api/v1/commons/shop", as: :shop