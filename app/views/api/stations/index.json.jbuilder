json.stations @stations, partial: "api/stations/station", as: :station
json.page_num @stations&.total_pages
