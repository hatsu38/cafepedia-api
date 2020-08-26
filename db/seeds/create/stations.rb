require 'csv'

CSV.foreach('./db/datas/stations/station.csv', headers: true) do |data|
  kanji_name = data['kanji'].include?('(') ? data['kanji'].sub!(/\(.*/m, '') : data['kanji']
  fixed_kanji_name = kanji_name.gsub(/ケ/, 'ヶ')
  Station.find_or_create_by!(
    kanji_name: fixed_kanji_name,
    kana_name: data['kana']
  )
rescue StandardError
  next
end