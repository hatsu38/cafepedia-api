json.shops do
  json.array! @shops, :id, :main_shop_eng_name, :city_code, :prefecture_name_e
end
json.total_pages @shops.total_pages