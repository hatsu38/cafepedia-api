# == Schema Information
#
# Table name: shop_stations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#  station_id :bigint           not null
#
# Indexes
#
#  index_shop_stations_on_shop_id     (shop_id)
#  index_shop_stations_on_station_id  (station_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (station_id => stations.id)
#
class ShopStation < ApplicationRecord
  belongs_to :shop
  belongs_to :station
end
