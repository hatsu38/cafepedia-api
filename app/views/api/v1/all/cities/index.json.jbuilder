json.cities do
  json.array! @cities, :id, :code, :prefecture_id
end