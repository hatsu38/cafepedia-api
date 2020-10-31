# bundle exec rake data_mainttenance:city_data_fix_by_seireitoshi
namespace :data_mainttenance do
  desc "政令指定都市の〇〇市XX区を〇〇市に、〇〇郡XX町を〇〇郡にする"
  task city_data_fix_by_seireitoshi: :environment do
    fix_target_cities = City.where(['name LIKE ?', "%市%区"]).or(City.where(['name LIKE ?', "%郡%町"])).order(:code, :prefecture_id)

    fix_target_cities.each do |city|
      match_city_name = /.*市/.match(city.name) || /.*郡/.match(city.name)
      next if City.find_by(name: match_city_name.to_s).present?

      new_city_code = create_new_city_code(city)

      City.create!(
        name: match_city_name.to_s,
        prefecture_id: city.prefecture_id,
        code: new_city_code
      )
    end
  end
end

def create_new_city_code(city)
  new_city_code_prefix = city.code.first(2) + "0"
  last_city_code = City.where(['code LIKE ?', "#{new_city_code_prefix}%"]).order(:code).last&.code || "000"

  new_city_code_suffix = format('%02d', last_city_code.last(2).to_i + 1)

  new_city_code_prefix + new_city_code_suffix
end