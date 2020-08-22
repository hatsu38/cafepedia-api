# frozen_string_literal: true

ActiveAdmin.register Shop do
  permit_params :name, :prefecture_name, :city_name, :other_address, :access,
                :tel, :business_hour, :chair, :hp, :wifi, :smoking,
                :is_open, :iccard, :lat, :lng, :socket
end
