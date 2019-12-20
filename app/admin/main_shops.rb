# frozen_string_literal: true

ActiveAdmin.register MainShop do
  permit_params :name, :image
end
