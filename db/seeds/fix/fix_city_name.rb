cities = City.where("name LIKE ?", "%ケ%")
if cities
  cities.each do |city|
    replaced_city_name = city.name.gsub(/ケ/, 'ヶ')
    city.update!(name: replaced_city_name)
  end
end