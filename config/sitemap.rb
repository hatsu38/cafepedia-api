# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://cafepedia.jp"

# Set the host name for URL creation
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET_NAME'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: 'ap-northeast-1'
)


SitemapGenerator::Sitemap.create do

  add root_path, changefreq: 'daily'

  main_shops = MainShop.all
  main_shops.each do |main_shop|
    add "/chain_shops/#{main_shop.eng_name}", changefreq: "daily"
  end

  Prefecture.all.each do |prefecture|
    add "#{prefecture.name_e}", changefreq: "daily"
    main_shops.each do |main_shop|
      add "#{prefecture.name_e}/chain_shops/#{main_shop.eng_name}", changefreq: "daily"
    end
  end

  City.all.select(:id, :code, :prefecture_id).each do |city|
    add "#{city.prefecture_name_e}/#{city.code}", changefreq: "daily"
    main_shops.each do |main_shop|
      add "#{city.prefecture_name_e}/#{city.code}/chain_shops/#{main_shop.eng_name}", changefreq: "daily"
    end
  end

  stations = Station.where.not(city_id: nil)
                          .select(:id, :prefecture_id, :city_id)
                          .page(params[:page])
                          .per(params[:per] || PER)
                          .preload(:city)
  stations.each do |station|
    add "#{station.prefecture_name_e}/#{station.city_code}/stations/#{station.id}", changefreq: "daily"
  end

  shops = Shop.where.not(city_id: nil)
                    .select(:id, :main_shop_id, :prefecture_id, :city_id)
                    .page(params[:page])
                    .per(params[:per] || PER)
                    .preload(:main_shop, :city)
  shops.all.each do |shop|
    add "#{shop.prefecture_name_e}/#{shop.city_code}/chain_shops/#{shop.main_shop_eng_name}/#{shop.id}", changefreq: "daily"
  end
end
