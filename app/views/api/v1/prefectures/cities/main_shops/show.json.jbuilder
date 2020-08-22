# frozen_string_literal: true
json.main_shop @main_shop, partial: "api/main_shops/main_shop", as: :main_shop
json.shops @shops, partial: "api/commons/shop", as: :shop
json.total_count @shops&.total_count