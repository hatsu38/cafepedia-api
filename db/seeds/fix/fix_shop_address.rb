shops = Shop.where("city_name LIKE ?", "%ケ%")
if shops
  shops.each do |shop|
    replaced_city_name = shop.city_name.gsub(/ケ/, 'ヶ')
    shop.update!(city_name: replaced_city_name)
  end
end

shops = Shop.where(city_name: "東京都渋谷区")
if shops
  shops.each do |shop|
    shop.update!(city_name: "渋谷区")
  end
end

shops = Shop.where(city_id: nil)
if shops
  shops.each do |shop|
    cities = City.where("name LIKE ?", "%#{shop.city_name}%")
    next if cities.blank?

    full_address = shop.full_address
    cities.each do |city|
      if full_address.include?(city.name)
        othre_address = city.name.delete(shop.city_name)

        shop.update!(
          other_address: shop.other_address.delete(othre_address),
          city_name: city.name,
          city_id: city.id
        )
      end
    end
  end
end