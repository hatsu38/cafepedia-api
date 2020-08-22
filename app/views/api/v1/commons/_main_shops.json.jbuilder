json.set! :main_shops do
  json.array! main_shops do |main_shop|
    json.id main_shop.id
    json.name main_shop.name
    json.eng_name main_shop.eng_name
    json.image main_shop.image
    json.created_at main_shop.created_at
    json.updated_at main_shop.updated_at
    json.shops_count main_shop.shops.size
  end
end
