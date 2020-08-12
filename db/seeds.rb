# frozen_string_literal: true

require 'csv'

path = '/images/'
mainshop_array = [
  {
    name: 'スターバックス',
    eng_name: 'starbacks',
    image: "#{path}starbacks_logo.png",
    csv: './cafe_csvs/starbacks.csv',
  },
  {
    name: 'ドトールコーヒー',
    eng_name: 'doutor',
    image: "#{path}doutor/doutor_logo.jpg",
    csv: './cafe_csvs/doutor/doutor.csv',
  },
  {
    name: 'タリーズコーヒー',
    eng_name: 'tullys',
    image: "#{path}tullys_logo.jpg",
    csv: './cafe_csvs/tullys.csv',
  },
  {
    name: 'コメダ珈琲',
    eng_name: 'komeda',
    image: "#{path}komeda_logo.jpg",
    csv: './cafe_csvs/komeda.csv',
  },
  {
    name: 'ルノアール',
    eng_name: 'kissa_renoir',
    image: "#{path}renoir/kissa_renior_logo.jpg",
    csv: './cafe_csvs/renoir/kissa_renoir.csv',
  },
  {
    name: 'PRONTO',
    eng_name: 'pronto',
    image: "#{path}pronto_logo.jpg",
    csv: './cafe_csvs/pronto.csv',
  },
  {
    name: '上島珈琲店',
    eng_name: 'ueshima',
    image: "#{path}ueshima/ueshima.png",
    csv: './cafe_csvs/ueshima.csv',
  },
  {
    name: 'オーバカナル|ドトールコーヒー',
    eng_name: 'auxbacchanales',
    image: "#{path}doutor/auxbacchanales_logo.jpg",
    csv: './cafe_csvs/doutor/auxbacchanales.csv',
  },
  {
    name: 'カフェ ラミル|ドトールコーヒー',
    eng_name: 'cafelamille',
    image: "#{path}doutor/cafelamille_logo.png",
    csv: './cafe_csvs/doutor/cafelamille.csv',
  },
  {
    name: 'カフェ レクセル|ドトールコーヒー',
    eng_name: 'cafelexcel',
    image: "#{path}doutor/cafelexcel_logo.png",
    csv: './cafe_csvs/doutor/cafelexcel.csv',
  },
  {
    name: 'カフェ コロラド|ドトールコーヒー',
    eng_name: 'colorado',
    image: "#{path}doutor/colorado_logo.png",
    csv: './cafe_csvs/doutor/colorado.csv',
  },
  {
    name: 'エクセルシオール|ドトールコーヒー',
    eng_name: 'execelsior',
    image: "#{path}doutor/execelsior_logo.jpg",
    csv: './cafe_csvs/doutor/execelsior.csv',
  },
  {
    name: 'ルサロンドニナス|ドトール',
    eng_name: 'lusalondninas',
    image: "#{path}doutor/lusalondninas_logo.gif",
    csv: './cafe_csvs/doutor/lusalondninas.csv',
  },
  {
    name: 'カフェ マカメドウズ|ドトール',
    eng_name: 'maukameadows',
    image: "#{path}doutor/maukameadows_logo.jpg",
    csv: './cafe_csvs/doutor/maukameadows.csv',
  },
  {
    name: 'ニナス パリ|ドトール',
    eng_name: 'ninas_pari',
    image: "#{path}doutor/ninas_pari_logo.png",
    csv: './cafe_csvs/doutor/ninas_pari.csv',
  },
  {
    name: 'パリッシモ|ドトール',
    eng_name: 'parissimo',
    image: "#{path}doutor/parissimo_logo.png",
    csv: './cafe_csvs/doutor/parissimo.csv',
  },
  {
    name: 'テ ニナス|ドトール',
    eng_name: 'teninasu',
    image: "#{path}doutor/teninasu_logo.png",
    csv: './cafe_csvs/doutor/teninasu.csv',
  },
  {
    name: 'Cafe Miyama|ルノアール',
    eng_name: 'cafemiyama',
    image: "#{path}renoir/cafemiyama_logo.jpg",
    csv: './cafe_csvs/renoir/cafemiyama.csv',
  },
  {
    name: 'Cafe Renoir|ルノアール',
    eng_name: 'caferenoir',
    image: "#{path}renoir/caferenoir_logo.png",
    csv: './cafe_csvs/renoir/caferenoir.csv',
  },
  {
    name: 'ミヤマ珈琲|ルノアール',
    eng_name: 'miyama_coffee',
    image: "#{path}renoir/miyama_coffee_logo.jpg",
    csv: './cafe_csvs/renoir/miyama_coffee.csv',
  },
  {
    name: 'MySpace|ルノアール',
    eng_name: 'myspace',
    image: "#{path}renoir/myspace_logo.png",
    csv: './cafe_csvs/renoir/myspace.csv',
  },
  {
    name: 'NewYorker’s Cafe|ルノアール',
    eng_name: 'newyorkers',
    image: "#{path}renoir/newyorkers_logo.png",
    csv: './cafe_csvs/renoir/newyorkers.csv',
  },
  {
    name: '瑠之亜珈琲|ルノアール',
    eng_name: 'runoacoffee',
    image: "#{path}renoir/runoacoffee_logo.png",
    csv: './cafe_csvs/renoir/runoacoffee.csv',
  },
  {
    name: 'ブックス&カフェ|上島珈琲店',
    eng_name: 'books_cafe',
    image: "#{path}ueshima/books_cafe.png",
    csv: './cafe_csvs/ueshima/books_cafe.csv',
  },
  {
    name: 'カフェノバール|上島珈琲店',
    eng_name: 'cafenobar',
    image: "#{path}ueshima/cafenobar.jpeg",
    csv: './cafe_csvs/ueshima/cafenobar.csv',
  },
  {
    name: 'カフェラ|上島珈琲店',
    eng_name: 'cafera',
    image: "#{path}ueshima/caffera.jpg",
    csv: './cafe_csvs/ueshima/cafera.csv',
  },
  {
    name: 'カフェコンフォート|上島珈琲店',
    eng_name: 'comfort',
    image: "#{path}ueshima/comfort.jpg",
    csv: './cafe_csvs/ueshima/comfort.csv',
  },
  {
    name: '神戸カプチーノ倶楽部|上島珈琲店',
    eng_name: 'kobe',
    image: "#{path}ueshima/kobe.jpg",
    csv: './cafe_csvs/ueshima/kobe.csv',
  },
  {
    name: 'MELLOW BROWN COFFEE|上島珈琲店',
    eng_name: 'mellow_brown',
    image: "#{path}ueshima/mellowbrown.png",
    csv: './cafe_csvs/ueshima/mellow_brown.csv',
  },
  {
    name: 'カフェメルカード|上島珈琲店',
    eng_name: 'mercard',
    image: "#{path}ueshima/mercado.jpg",
    csv: './cafe_csvs/ueshima/mercard.csv',
  },
  {
    name: 'カフェプラザ|上島珈琲店',
    eng_name: 'plaza',
    image: "#{path}ueshima/plaza.jpeg",
    csv: './cafe_csvs/ueshima/plaza.csv',
  },
  {
    name: 'ウイーンの森|上島珈琲店',
    eng_name: 'wien',
    image: "#{path}ueshima/wien.png",
    csv: './cafe_csvs/ueshima/wien.csv',
  },
  {
    name: 'その他|上島珈琲店',
    eng_name: 'ueshima_other',
    image: "#{path}ueshima/other.png",
    csv: './cafe_csvs/ueshima/other.csv',
  },
  {
    name: 'Senbon Lab.',
    eng_name: 'senbonlab',
    image: "#{path}senbonlab_logo.jpg",
    csv: './cafe_csvs/senbonlab.csv',
  },
]

mainshop_array.each do |shop|
  main_shop = MainShop.find_by(name: shop[:name]) || MainShop.find_by(eng_name: shop[:eng_name])
  unless main_shop
    main_shop = MainShop.find_or_create_by!(
                  name: shop[:name],
                  eng_name: shop[:eng_name],
                  image: shop[:image]
                )
  end
  CSV.foreach(shop[:csv], headers: true) do |data|
    next if main_shop.shops.find_by(name: data['name'])
    prefecture = Prefecture.find_by_name(data['prefecture'])
    main_shop.shops.find_or_create_by!(
      name: data['name'],
      prefecture_name: prefecture.name,
      city_name: data['city'],
      other_address: data['other_address'],
      access: data['access'],
      tel: data['tel'],
      business_hour: data['business_hour'],
      hp: data['hp'],
      wifi: data['wifi'],
      socket: data['socket'],
      smoking: data['smoking'],
      iccard: data['iccard'],
      lat: data['lat'],
      lng: data['lng'],
      prefecture_id: prefecture.id
    )
  end
end

CSV.foreach('./cafe_csvs/eki.csv', headers: true) do |data|
  kanji_name = data['kanji'].include?('(') ? data['kanji'].sub!(/\(.*/m, '') : data['kanji']
  Station.find_or_create_by!(
    kanji_name: kanji_name,
    kana_name: data['kana']
  )
rescue StandardError
  next
end

if CongrestionInfo.count < 3
  CongrestionInfo.find_or_create_by!(name: '混んでる')
  CongrestionInfo.find_or_create_by!(name: 'やや混んでる')
  CongrestionInfo.find_or_create_by!(name: '空いてる')
end

Shop.access_station("駅").each do |shop|
  station_names = shop.access.match(/.*?駅/)
  next if station_names.nil?

  station = Station.find_by(kanji_name: station_names[0])
  next if station.nil?

  ShopStation.find_or_create_by!(
    shop_id: shop.id,
    station_id: station.id
  )
end

def self.get_near_stations_json(station_name)
  count = 0
  uri = URI("https://express.heartrails.com/api/json")
  params = { method: "getStations", name: station_name }
  uri.query = URI.encode_www_form(params)
  begin
    response = Net::HTTP.get_response(uri)
    response.is_a?(Net::HTTPSuccess) ? JSON.parse(response.body)["response"]["station"] : nil
  rescue => error
    return nil if count > 3
    sleep(10)
    count += 1
    get_near_stations_json(station_name)
  end
end

Station.all.find_each do |station|
  station_name = station.kanji_name.last == "駅" ? station.kanji_name.chop : station.kanji_name
  near_stations_json = get_near_stations_json(station_name)
  next unless near_stations_json

  near_station_names = near_stations_json.pluck("prev","next").flatten.compact.uniq
  near_station_names.each do |near_station_name|
    near_station = Station.find_by(kanji_name: "#{near_station_name}駅") || Station.find_by(kanji_name: near_station_name)
    next if near_station.nil?
    puts near_station.kanji_name
    NearStationRelationship.find_or_create_by!(
      main_station_id: station.id,
      near_station_id: near_station.id
    )
  end
  sleep(0.5)
end
