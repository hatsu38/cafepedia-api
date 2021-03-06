# bundle exec rake data_mainttenance:station_data_fix_by_seireitoshi
namespace :data_mainttenance do
  desc "政令指定都市の〇〇市XX区の駅の市区町村を〇〇市に、〇〇郡XX町の駅の市区町村を〇〇郡にする"
  task station_data_fix_by_seireitoshi: :environment do
    fix_target_cities = City.where(['name LIKE ?', "%市%区"]).or(City.where(['name LIKE ?', "%郡%町"])).order(:code, :prefecture_id)

    fix_target_cities.each do |city|
      next if city.stations.blank?

      match_city_name = /.*市/.match(city.name) || /.*郡/.match(city.name)
      new_city = City.find_by(name: match_city_name.to_s)
      next if new_city.nil?

      city.stations.update(city_id: new_city.id)
    end
  end
end