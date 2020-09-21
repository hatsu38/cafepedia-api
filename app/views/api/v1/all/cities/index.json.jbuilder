json.cities do
  json.array! @cities, :id, :code, :prefecture_name_e
end