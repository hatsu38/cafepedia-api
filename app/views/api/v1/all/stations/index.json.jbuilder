json.stations do
  json.array! @stations, :id, :city_id, :prefecture_id
end