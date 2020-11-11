json.city @city, partial: "api/v1/commons/city", as: :city
json.cities @cities, partial: "api/v1/commons/city", as: :city
json.stations @stations, partial: "api/v1/commons/station", as: :station
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.shops_total_count @shops&.size