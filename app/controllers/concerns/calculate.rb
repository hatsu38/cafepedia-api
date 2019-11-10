# frozen_string_literal: true

module Calculate
  def self.distance(cafe_lat, cafe_lng, current_pos_lat, current_pos_lng)
    # ラジアン単位に変換
    x1 = cafe_lat.to_f * Math::PI / 180
    y1 = cafe_lng.to_f * Math::PI / 180
    x2 = current_pos_lat.to_f * Math::PI / 180
    y2 = current_pos_lng.to_f * Math::PI / 180
    # 地球の半径 (km)
    radius = 6378.137
    # 差の絶対値
    diff_y = (y1 - y2).abs
    calc1 = Math.cos(x2) * Math.sin(diff_y)
    calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
    # 分子
    numerator = Math.sqrt(calc1**2 + calc2**2)
    # 分母
    denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
    # 弧度
    degree = Math.atan2(numerator, denominator)
    # 大円距離 (km)
    degree * radius
  end
end
