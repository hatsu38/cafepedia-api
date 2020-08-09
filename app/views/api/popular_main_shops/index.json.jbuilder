# frozen_string_literal: true

json.set! :main_shops do
  json.array! @main_shops do |shop|
    json.extract! shop,
                  :id,
                  :name,
                  :eng_name,
                  :image,
                  :created_at,
                  :updated_at
  end
end
