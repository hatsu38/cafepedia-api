path = '/images/'
csv_root = './db/datas/cafes/'
mainshop_array = [
  {
    name: 'スターバックス',
    eng_name: 'starbacks',
    image: "#{path}starbacks_logo.png",
    csv: "#{csv_root}starbacks.csv",
  },
  {
    name: 'ドトールコーヒー',
    eng_name: 'doutor',
    image: "#{path}doutor/doutor_logo.jpg",
    csv: "#{csv_root}doutor/doutor.csv",
  },
  {
    name: 'タリーズコーヒー',
    eng_name: 'tullys',
    image: "#{path}tullys_logo.jpg",
    csv: "#{csv_root}tullys.csv",
  },
  {
    name: 'コメダ珈琲',
    eng_name: 'komeda',
    image: "#{path}komeda_logo.jpg",
    csv: "#{csv_root}komeda.csv",
  },
  {
    name: 'ルノアール',
    eng_name: 'kissa_renoir',
    image: "#{path}renoir/kissa_renior_logo.jpg",
    csv: "#{csv_root}renoir/kissa_renoir.csv",
  },
  {
    name: 'PRONTO',
    eng_name: 'pronto',
    image: "#{path}pronto_logo.jpg",
    csv: "#{csv_root}pronto.csv",
  },
  {
    name: '上島珈琲店',
    eng_name: 'ueshima',
    image: "#{path}ueshima/ueshima.png",
    csv: "#{csv_root}ueshima.csv",
  },
  {
    name: 'オーバカナル',
    eng_name: 'auxbacchanales',
    image: "#{path}doutor/auxbacchanales_logo.jpg",
    csv: "#{csv_root}doutor/auxbacchanales.csv",
  },
  {
    name: 'カフェ ラミル',
    eng_name: 'cafelamille',
    image: "#{path}doutor/cafelamille_logo.png",
    csv: "#{csv_root}doutor/cafelamille.csv",
  },
  {
    name: 'カフェ レクセル',
    eng_name: 'cafelexcel',
    image: "#{path}doutor/cafelexcel_logo.png",
    csv: "#{csv_root}doutor/cafelexcel.csv",
  },
  {
    name: 'カフェ コロラド',
    eng_name: 'colorado',
    image: "#{path}doutor/colorado_logo.png",
    csv: "#{csv_root}doutor/colorado.csv",
  },
  {
    name: 'エクセルシオール',
    eng_name: 'execelsior',
    image: "#{path}doutor/execelsior_logo.jpg",
    csv: "#{csv_root}doutor/execelsior.csv",
  },
  {
    name: 'ルサロンドニナス',
    eng_name: 'lusalondninas',
    image: "#{path}doutor/lusalondninas_logo.gif",
    csv: "#{csv_root}doutor/lusalondninas.csv",
  },
  {
    name: 'カフェ マカメドウズ',
    eng_name: 'maukameadows',
    image: "#{path}doutor/maukameadows_logo.jpg",
    csv: "#{csv_root}doutor/maukameadows.csv",
  },
  {
    name: 'ニナス パリ',
    eng_name: 'ninas_pari',
    image: "#{path}doutor/ninas_pari_logo.png",
    csv: "#{csv_root}doutor/ninas_pari.csv",
  },
  {
    name: 'パリッシモ',
    eng_name: 'parissimo',
    image: "#{path}doutor/parissimo_logo.png",
    csv: "#{csv_root}doutor/parissimo.csv",
  },
  {
    name: 'テ ニナス',
    eng_name: 'teninasu',
    image: "#{path}doutor/teninasu_logo.png",
    csv: "#{csv_root}doutor/teninasu.csv",
  },
  {
    name: 'Cafe Miyama',
    eng_name: 'cafemiyama',
    image: "#{path}renoir/cafemiyama_logo.jpg",
    csv: "#{csv_root}renoir/cafemiyama.csv",
  },
  {
    name: 'Cafe Renoir',
    eng_name: 'caferenoir',
    image: "#{path}renoir/caferenoir_logo.png",
    csv: "#{csv_root}renoir/caferenoir.csv",
  },
  {
    name: 'ミヤマ珈琲',
    eng_name: 'miyama_coffee',
    image: "#{path}renoir/miyama_coffee_logo.jpg",
    csv: "#{csv_root}renoir/miyama_coffee.csv",
  },
  {
    name: 'MySpace',
    eng_name: 'myspace',
    image: "#{path}renoir/myspace_logo.png",
    csv: "#{csv_root}renoir/myspace.csv",
  },
  {
    name: 'NewYorker’s Cafe',
    eng_name: 'newyorkers',
    image: "#{path}renoir/newyorkers_logo.png",
    csv: "#{csv_root}renoir/newyorkers.csv",
  },
  {
    name: '瑠之亜珈琲',
    eng_name: 'runoacoffee',
    image: "#{path}renoir/runoacoffee_logo.png",
    csv: "#{csv_root}renoir/runoacoffee.csv",
  },
  {
    name: 'ブックス&カフェ',
    eng_name: 'books_cafe',
    image: "#{path}ueshima/books_cafe.png",
    csv: "#{csv_root}ueshima/books_cafe.csv",
  },
  {
    name: 'カフェノバール',
    eng_name: 'cafenobar',
    image: "#{path}ueshima/cafenobar.jpeg",
    csv: "#{csv_root}ueshima/cafenobar.csv",
  },
  {
    name: 'カフェラ',
    eng_name: 'cafera',
    image: "#{path}ueshima/caffera.jpg",
    csv: "#{csv_root}ueshima/cafera.csv",
  },
  {
    name: 'カフェコンフォート',
    eng_name: 'comfort',
    image: "#{path}ueshima/comfort.jpg",
    csv: "#{csv_root}ueshima/comfort.csv",
  },
  {
    name: '神戸カプチーノ倶楽部',
    eng_name: 'kobe',
    image: "#{path}ueshima/kobe.jpg",
    csv: "#{csv_root}ueshima/kobe.csv",
  },
  {
    name: 'MELLOW BROWN COFFEE',
    eng_name: 'mellow_brown',
    image: "#{path}ueshima/mellowbrown.png",
    csv: "#{csv_root}ueshima/mellow_brown.csv",
  },
  {
    name: 'カフェメルカード',
    eng_name: 'mercard',
    image: "#{path}ueshima/mercado.jpg",
    csv: "#{csv_root}ueshima/mercard.csv",
  },
  {
    name: 'カフェプラザ',
    eng_name: 'plaza',
    image: "#{path}ueshima/plaza.jpeg",
    csv: "#{csv_root}ueshima/plaza.csv",
  },
  {
    name: 'ウイーンの森',
    eng_name: 'wien',
    image: "#{path}ueshima/wien.png",
    csv: "#{csv_root}ueshima/wien.csv",
  },
  {
    name: 'その他|上島珈琲店',
    eng_name: 'ueshima_other',
    image: "#{path}ueshima/other.png",
    csv: "#{csv_root}ueshima/other.csv",
  },
  {
    name: 'Senbon Lab.',
    eng_name: 'senbonlab',
    image: "#{path}senbonlab_logo.jpg",
    csv: "#{csv_root}senbonlab.csv",
  },
]

mainshop_array.each do |shop|
  main_shop = MainShop.find_by(name: shop[:name]) || MainShop.find_by(eng_name: shop[:eng_name]) || MainShop.find_or_create_by!(name: shop[:name], eng_name: shop[:eng_name], image: shop[:image])

  CSV.foreach(shop[:csv], headers: true) do |data|
    next if main_shop.shops.find_by(name: data['name']) || main_shop.shops.find_by(hp: data['hp']) || main_shop.shops.find_by(tel: data['tel'])

    begin
      prefecture = Prefecture.find_by_name(data['prefecture']&.strip)
      if prefecture.nil?
        puts data
        binding.pry
      end
      city = prefecture.cities.find_by(name: data['city'])
      Rails.logger.debug("#{city}のお店")
      main_shop.shops.find_or_create_by!(
        name: data['name'],
        prefecture_name: prefecture.name,
        city_name: data['city'].gsub(/ケ/, 'ヶ'),
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
        prefecture_id: prefecture.id,
        city_id: city&.id
      )
    rescue => e
      binding.pry
    end
  end
end