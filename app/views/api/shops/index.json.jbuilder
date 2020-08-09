# frozen_string_literal: true

json.shops @shops, partial: "api/commons/shop", as: :shop
json.total_count @shops&.total_count