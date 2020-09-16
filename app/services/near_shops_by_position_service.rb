class NearShopsByPositionService
  RADIUS = 6378.137 # 地球の半径 (km)
  def execute(shops, latitude, longitude)
    shops.each do |shop|
      distance = calculate_distance_from_position(shop, latitude, longitude)
      shop.set_deistance(distance)
    end
    # distanceでOrderができないのでSortを使用している
    shops.sort_by(&:distance)
  end

  private

  def calculate_distance_from_position(shop, latitude, longitude) # rubocop:disable Metrics/AbcSize
    # ラジアン単位に変換
    x1 = shop.lat.to_d * Math::PI / 180
    y1 = shop.lng.to_d * Math::PI / 180
    x2 = latitude.to_d * Math::PI / 180
    y2 = longitude.to_d * Math::PI / 180

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
    degree * RADIUS
  end
end
