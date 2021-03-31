namespace :shops do
  desc "ショップと都道府県コードを紐付け"
  task reference_prefecture: :environment do
    Prefecture.all.each do |prefecture|
      begin
        Shop.where(prefecture_name: prefecture[:name]).update(prefecture_id: prefecture[:id])
      rescue => e
        Sentry.capture_exception(e)
      end
    end
  end
end
