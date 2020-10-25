# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://cafepedia.jp"

if Rails.env.production?
  # Set the host name for URL creation
  SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{Rails.application.credentials.aws[:s3_backet_name]}"
  SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
    Rails.application.credentials.aws[:s3_backet_name],
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    aws_region: 'ap-northeast-1'
  )
end


require "csv"

SitemapGenerator::Sitemap.create do
  urls = CSV.read(Rails.root.join("config/datas", "404_list.csv"), headers: true).map { |data| data["URL"] }

  add root_path, changefreq: 'daily'
  main_shop_eng_names = MainShop.all.pluck(:eng_name)
  main_shop_eng_names.each do |main_shop_eng_name|
    target_url = "/chain_shops/#{main_shop_eng_name}"
    next if urls.include?(target_url)
    add target_url, changefreq: "daily", priority: 1.0
  end

  Prefecture.all.each do |prefecture|
    add "#{prefecture.name_e}", changefreq: "daily", priority: 1.0
    main_shop_eng_names.each do |main_shop_eng_name|
      target_url = "#{prefecture.name_e}/chain_shops/#{main_shop_eng_name}"
      next if urls.include?(target_url)
      add target_url, changefreq: "daily", priority: 0.8
    end
  end

  City.all.select(:id, :code, :prefecture_id).each do |city|
    add "#{city.prefecture_name_e}/#{city.code}", changefreq: "daily", priority: 0.8
    main_shop_eng_names.each do |main_shop_eng_name|
      target_url = "#{city.prefecture_name_e}/#{city.code}/chain_shops/#{main_shop_eng_name}"
      next if urls.include?(target_url)
      add target_url, changefreq: "daily", priority: 0.6
    end
  end

  stations = Station.where.not(city_id: nil)
                          .select(:id, :prefecture_id, :city_id)
                          .preload(:city)
  stations.each do |station|
    target_url = "#{station.prefecture_name_e}/#{station.city_code}/stations/#{station.id}"
    next if urls.include?(target_url)
    add target_url, changefreq: "daily", priority: 0.8
  end

  shops = Shop.where.not(city_id: nil)
                    .select(:id, :main_shop_id, :prefecture_id, :city_id)
                    .preload(:main_shop, :city)
  shops.all.each do |shop|
    target_url = "#{shop.prefecture_name_e}/#{shop.city_code}/chain_shops/#{shop.main_shop_eng_name}/#{shop.id}"
    next if urls.include?(target_url)
    add target_url, changefreq: "daily", priority: 0.5
  end
end
