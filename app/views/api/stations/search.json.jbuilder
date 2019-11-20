json.set! :stations do
  json.array! @stations do |station|
    json.extract! station,
                  :id,
                  :kanji_name,
                  :kana_name
                  :created_at
  end
end
json.page_num @stations.total_pages
