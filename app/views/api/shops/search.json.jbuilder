# frozen_string_literal: true

json.set! :shops do
  json.array! @shops do |shop|
    json.id shop['id']
    json.name shop['name']
    json.prefecture shop['prefecture']
    json.city shop['city']
    json.other_address shop['other_address']
    json.access shop['access']
    json.tel shop['tel']
    json.business_hour shop['business_hour']
    json.chair shop['chair']
    json.hp shop['hp']
    json.wifi shop['wifi']
    json.socket shop['socket']
    json.smoking shop['smoking']
    json.iccard shop['iccard']
    json.is_open shop['is_open']
    json.lat shop['lat']
    json.lng shop['lng']
    json.image @main_shops.find{|n| n[0] == shop['id']}[3]
    json.main_shop_name @main_shops.find{|n| n[0] == shop['id']}[1]
    json.main_shop_eng_name @main_shops.find{|n| n[0] == shop['id']}[2]
    if shop['distance'] > 1
      json.distance "#{shop['distance'].round(2)}km"
    else
      json.distance "#{(shop['distance'] * 1000).round(1)}m"
    end
  end
end
