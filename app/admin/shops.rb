# frozen_string_literal: true

ActiveAdmin.register Shop do
  permit_params :name, :prefecture, :city, :other_address, :access,
  :tel, :business_hour, :chair, :hp, :wifi, :smoking,
  :is_open, :iccard, :lat, :lng, :socket
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :prefecture, :city, :other_address, :access, :tel, :business_hour, :chair, :hp, :wifi, :socket, :smoking, :iccard, :lat, :lng, :is_open, :main_shop_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :prefecture, :city, :other_address, :access, :tel, :business_hour, :chair, :hp, :wifi, :socket, :smoking, :iccard, :lat, :lng, :is_open, :main_shop_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
