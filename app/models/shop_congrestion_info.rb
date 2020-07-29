# == Schema Information
#
# Table name: shop_congrestion_infos
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  congrestion_info_id :bigint
#  shop_id             :bigint
#
# Indexes
#
#  index_shop_congrestion_infos_on_congrestion_info_id  (congrestion_info_id)
#  index_shop_congrestion_infos_on_shop_id              (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (congrestion_info_id => congrestion_infos.id)
#  fk_rails_...  (shop_id => shops.id)
#
class ShopCongrestionInfo < ApplicationRecord
  belongs_to :shop
  belongs_to :congrestion_info

  # 現在時間帯の前後1時間帯に投稿された投稿を取得
  scope :same_about_time_post, lambda {
    where(
      'created_at::time >= ? and created_at::time < ?',
      Time.zone.now.ago(1.hour).strftime('%T'),
      Time.zone.now.since(1.hour).strftime('%T')
    )
  }

  # 現在と同じ曜日に投稿された投稿を取得
  scope :same_about_day_of_week_post, lambda {
    where('extract(dow from created_at) = ?', Time.zone.now.wday)
  }
end
