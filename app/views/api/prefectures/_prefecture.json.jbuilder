json.id prefecture.id
json.prefecture_name prefecture.name
json.name_e prefecture.name_e
json.name_h prefecture.name_h
json.name_k prefecture.name_k
json.area prefecture.area
json.shops_count prefecture.shops.size
json.shops prefecture.shops.limit(5), partial: "api/commons/shop", as: :shop