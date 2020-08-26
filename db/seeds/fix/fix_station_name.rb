stations = Station.where("kanji_name LIKE ?", "%ケ%")
if stations
  stations.each do |station|
    replaced_station_name = station.kanji_name.gsub(/ケ/, 'ヶ')
    station.update!(kanji_name: replaced_station_name)
  end
end