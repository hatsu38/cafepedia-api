json.cities @cities, partial: "api/v1/commons/city", as: :city
json.page_num @cities.total_pages
