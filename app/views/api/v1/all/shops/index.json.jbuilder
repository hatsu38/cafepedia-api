json.shops do
  json.array! @shops, :id, :main_shop_id, :city_id, :prefecture_id
end