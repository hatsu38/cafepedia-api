require 'csv'

# Dir.glob(Rails.root.join("db/seeds/create/*.rb")).sort.each do |file|
#   require file
# end

# Dir.glob(Rails.root.join("db/seeds/fix/*.rb")).sort.each do |file|
#   require file
# end

Dir.glob(Rails.root.join("db/seeds/fix/fix_lat_lng_station.rb")).sort.each do |file|
  require file
end

# Dir.glob(Rails.root.join("db/seeds/set_reference/*.rb")).sort.each do |file|
#   require file
# end

# if AdminUser.find_by(email: Rails.application.credentials.admin[:email]).nil?
#   AdminUser.create!(
#     email: Rails.application.credentials.admin[:email],
#     password: Rails.application.credentials.admin[:password]
#   )
# end
