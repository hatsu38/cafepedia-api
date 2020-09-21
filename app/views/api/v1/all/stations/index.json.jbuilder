json.stations do
  json.array! @stations, :id, :city_code, :prefecture_name_e
end
json.total_pages @stations.total_pages