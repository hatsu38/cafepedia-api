# frozen_string_literal: true

require 'csv'

require 'csv'

path = '/images/'
mainshop_array = [
  {
    name: 'スターバックス',
    image: "#{path}starbacks_logo.png",
    csv: './cafe_csvs/starbacks.csv',
  },
  {
    name: 'ドトールコーヒー',
    image: "#{path}doutor/doutor_logo.jpg",
    csv: './cafe_csvs/doutor/doutor.csv',
  },
  {
    name: 'タリーズコーヒー',
    image: "#{path}tullys_logo.jpg",
    csv: './cafe_csvs/tullys.csv',
  },
  {
    name: 'コメダ珈琲',
    image: "#{path}komeda_logo.jpg",
    csv: './cafe_csvs/komeda.csv',
  },
  {
    name: 'ルノアール',
    image: "#{path}renoir/kissa_renior_logo.jpg",
    csv: './cafe_csvs/renoir/kissa_renoir.csv',
  },
  {
    name: 'PRONTO',
    image: "#{path}pronto_logo.jpg",
    csv: './cafe_csvs/pronto.csv',
  },
  {
    name: '上島珈琲店',
    image: "#{path}ueshima/ueshima.png",
    csv: './cafe_csvs/ueshima.csv',
  },
  {
    name: 'オーバカナル|ドトールコーヒー',
    image: "#{path}doutor/auxbacchanales_logo.jpg",
    csv: './cafe_csvs/doutor/auxbacchanales.csv',
  },
  {
    name: 'カフェ ラミル|ドトールコーヒー',
    image: "#{path}doutor/cafelamille_logo.png",
    csv: './cafe_csvs/doutor/cafelamille.csv',
  },
  {
    name: 'カフェ レクセル|ドトールコーヒー',
    image: "#{path}doutor/cafelexcel_logo.png",
    csv: './cafe_csvs/doutor/cafelexcel.csv',
  },
  {
    name: 'カフェ コロラド|ドトールコーヒー',
    image: "#{path}doutor/colorado_logo.png",
    csv: './cafe_csvs/doutor/colorado.csv',
  },
  {
    name: 'エクセルシオール|ドトールコーヒー',
    image: "#{path}doutor/execelsior_logo.jpg",
    csv: './cafe_csvs/doutor/execelsior.csv',
  },
  {
    name: 'ルサロンドニナス|ドトール',
    image: "#{path}doutor/lusalondninas_logo.gif",
    csv: './cafe_csvs/doutor/lusalondninas.csv',
  },
  {
    name: 'カフェ マカメドウズ|ドトール',
    image: "#{path}doutor/maukameadows_logo.jpg",
    csv: './cafe_csvs/doutor/maukameadows.csv',
  },
  {
    name: 'ニナス パリ|ドトール',
    image: "#{path}doutor/ninas_pari_logo.png",
    csv: './cafe_csvs/doutor/ninas_pari.csv',
  },
  {
    name: 'パリッシモ|ドトール',
    image: "#{path}doutor/parissimo_logo.png",
    csv: './cafe_csvs/doutor/parissimo.csv',
  },
  {
    name: 'テ ニナス|ドトール',
    image: "#{path}doutor/teninasu_logo.png",
    csv: './cafe_csvs/doutor/teninasu.csv',
  },
  {
    name: 'Cafe Miyama|ルノアール',
    image: "#{path}renoir/cafemiyama_logo.jpg",
    csv: './cafe_csvs/renoir/cafemiyama.csv',
  },
  {
    name: 'Cafe Renoir|ルノアール',
    image: "#{path}renoir/caferenoir_logo.png",
    csv: './cafe_csvs/renoir/caferenoir.csv',
  },
  {
    name: 'ミヤマ珈琲|ルノアール',
    image: "#{path}renoir/miyama_coffee_logo.jpg",
    csv: './cafe_csvs/renoir/miyama_coffee.csv',
  },
  {
    name: 'MySpace|ルノアール',
    image: "#{path}renoir/myspace_logo.png",
    csv: './cafe_csvs/renoir/myspace.csv',
  },
  {
    name: 'NewYorker’s Cafe|ルノアール',
    image: "#{path}renoir/newyorkers_logo.png",
    csv: './cafe_csvs/renoir/newyorkers.csv',
  },
  {
    name: '瑠之亜珈琲|ルノアール',
    image: "#{path}renoir/runoacoffee_logo.png",
    csv: './cafe_csvs/renoir/runoacoffee.csv',
  },
  {
    name: 'ブックス&カフェ|上島珈琲店',
    image: "#{path}ueshima/books_cafe.png",
    csv: './cafe_csvs/ueshima/books_cafe.csv',
  },
  {
    name: 'カフェノバール|上島珈琲店',
    image: "#{path}ueshima/cafenobar.jpeg",
    csv: './cafe_csvs/ueshima/cafenobar.csv',
  },
  {
    name: 'カフェラ|上島珈琲店',
    image: "#{path}ueshima/caffera.jpg",
    csv: './cafe_csvs/ueshima/cafera.csv',
  },
  {
    name: 'カフェコンフォート|上島珈琲店',
    image: "#{path}ueshima/comfort.jpg",
    csv: './cafe_csvs/ueshima/comfort.csv',
  },
  {
    name: '神戸カプチーノ倶楽部|上島珈琲店',
    image: "#{path}ueshima/kobe.jpg",
    csv: './cafe_csvs/ueshima/kobe.csv',
  },
  {
    name: 'MELLOW BROWN COFFEE|上島珈琲店',
    image: "#{path}ueshima/mellowbrown.png",
    csv: './cafe_csvs/ueshima/mellow_brown.csv',
  },
  {
    name: 'カフェメルカード|上島珈琲店',
    image: "#{path}ueshima/mercado.jpg",
    csv: './cafe_csvs/ueshima/mercard.csv',
  },
  {
    name: 'カフェプラザ|上島珈琲店',
    image: "#{path}ueshima/plaza.jpeg",
    csv: './cafe_csvs/ueshima/plaza.csv',
  },
  {
    name: 'ウイーンの森|上島珈琲店',
    image: "#{path}ueshima/wien.png",
    csv: './cafe_csvs/ueshima/wien.csv',
  },
  {
    name: 'その他|上島珈琲店',
    image: "#{path}ueshima/other.png",
    csv: './cafe_csvs/ueshima/other.csv',
  },
  {
    name: 'Senbon Lab.',
    image: "#{path}senbonlab_logo.jpg",
    csv: './cafe_csvs/senbonlab.csv',
  },
]

mainshop_array.each_with_index do |shop, _idx|
  main_shop = MainShop.find_or_create_by(name: shop[:name], image: shop[:image])
  CSV.foreach(shop[:csv], headers: true) do |data|
    main_shop.shops.find_or_create_by!(
      name: data['name'],
      prefecture: data['prefecture'],
      city: data['city'],
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
      lng: data['lng']
    )
  end
end
