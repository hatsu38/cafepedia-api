json.station @station, partial: "station", as: :station
json.shops @shops, partial: "api/commons/shop", as: :shop
json.total_count @shops&.total_count
json.near_stations @near_stations, partial: "station", as: :station
