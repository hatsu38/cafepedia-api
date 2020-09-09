namespace :data_mainttenance do
  desc "「 | チェーン店名」を削除"
  task del_chain_name_from_shop_name: :environment do
    Shop.search_name_by_keyword(" | ").each do |shop|
      next unless shop.name.include?(" | ")
      fixed_name = shop.name.sub(/ \| .*/m, "")
      shop.update(name: fixed_name)
    end
  end
end