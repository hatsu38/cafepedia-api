json.id prefecture.id
json.name prefecture.name
json.ellipsis_name prefecture.ellipsis_name
json.name_e prefecture.name_e
json.name_h prefecture.name_h
json.name_k prefecture.name_k
json.area prefecture.area
json.shops_count prefecture.shops.size
json.shops prefecture.shops.open.eager_load(:main_shop).limit(5), partial: "api/v1/commons/shop", as: :shop