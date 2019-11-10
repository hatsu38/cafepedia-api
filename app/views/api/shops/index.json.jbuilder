# frozen_string_literal: true

json.set! :shops do
  json.array! @shops do |shop|
    json.extract! shop,
                  :id,
                  :name,
                  :prefecture,
                  :city,
                  :other_address,
                  :access,
                  :tel,
                  :business_hour,
                  :chair,
                  :hp,
                  :wifi,
                  :socket,
                  :smoking,
                  :iccard,
                  :is_open,
                  :lat,
                  :lng,
                  :main_shop,
                  :created_at,
                  :updated_at
  end
end
