json.stations @stations, partial: "api/v1/commons/station", as: :station
json.page_num @stations.total_pages
