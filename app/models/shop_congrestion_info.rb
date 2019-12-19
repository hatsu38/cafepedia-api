class ShopCongrestionInfo < ApplicationRecord
  belongs_to :shop
  belongs_to :congrestion_info

  scope :same_about_time_post, lambda {
    now = Time.zone.now.hour
    case now
    when 6...12
      where('created_at::time > ?', '06:00:00').where('created_at::time < ?', '11:59:59')
    when 12...16
      where('created_at::time > ?', '12:00:00').where('created_at::time < ?', '15:59:59')
    when 16...19
      where('created_at::time > ?', '16:00:00').where('created_at::time < ?', '18:59:59')
    when 19...23
      where('created_at::time > ?', '19:00:00').where('created_at::time < ?', '22:59:59')
    when 23 || 0...6
      where('created_at::time > ?', '23:00:00').where('created_at::time < ?', ':59:59')
    end
  }
end
