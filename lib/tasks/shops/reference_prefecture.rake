namespace :shops do
  desc "ショップと都道府県コードを紐付け"
  task reference_prefecture: :environment do
    Shop.all.find_each do |shop|
      begin
        shop.update(prefecture_id: Prefecture.find_by_name(shop.prefecture_name).id)
      rescue => e
        Raven.extra_context(e)
      end
    end
  end
end
