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
