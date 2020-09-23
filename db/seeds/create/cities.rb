require 'open-uri'

now = Time.zone.now

csv = URI.parse('https://raw.githubusercontent.com/geolonia/japanese-addresses/master/data/latest.csv').open { |f| f.read }

# 市区町村コードでユニークする
cities_by_uniqed_city_code = CSV.parse(csv)[1..-1].uniq { |data| data[4] }

# 必要なデータのIndexをとる
data = CSV.parse(csv)[0]
city_code_index = data.find_index("市区町村コード")
city_name_index = data.find_index("市区町村名")
prefecutre_code_index = data.find_index("都道府県コード")

cities = []
cities_by_uniqed_city_code.each do |data|
  city = City.find_by(code: data[city_code_index])

  next if city && (city.name == data[city_name_index] || city.name.gsub(/ケ/, 'ヶ') == data[city_name_index])

  if city
    city.name = data[city_name_index].gsub(/ケ/, 'ヶ')
    city.prefecture_id = data[prefecutre_code_index].to_i
    city.save!
  end

  City.create(
    code: data[city_code_index],
    name: data[city_name_index],
    prefecture_id: format('%01d', data[prefecutre_code_index].to_i)
  )
end
