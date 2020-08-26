json.station @station, partial: "api/v1/commons/station", as: :station
json.shops @shops, partial: "api/v1/commons/shop", as: :shop
json.total_count @shops&.total_count