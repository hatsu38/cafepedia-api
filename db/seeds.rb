require "csv"

main_shop = MainShop.find_or_create_by(name: 'スターバックス', image: 'https://lohas.nicoseiga.jp/thumb/865728i?1303612428')
list = []
CSV.foreach('./cafe_list.csv', headers: true) do |row|
  main_shop.shops.find_or_create_by!(
            name: row['name'],
            prefecture: row['prefecture'],
            city: row['city'],
            other_address: row['other_address'],
            access: row['access'],
            tel: row['tel'],
            business_hour: row['business_hour'],
            hp: row['hp'],
            wifi: row['wifi'],
            socket: row['socket'],
            smoking: row['smoking'],
            iccard: row['iccard'],
            lat: row['lat'],
            lng: row['lng']
  )
end

