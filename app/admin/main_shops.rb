# frozen_string_literal: true

ActiveAdmin.register MainShop do
  permit_params :name, :eng_name, :image, :logo

  form do |f|
    f.inputs 'MainShop' do
      f.input :name
      f.input :eng_name
      f.input :image
      f.input :logo, as: :file
    end
    f.actions
  end

  show do |main_shop|
    attributes_table do
      row :name
      row :eng_name
      row :image
      row :logo do
        image_tag(main_shop.logo.url) if main_shop.logo.url
      end
    end
  end
end
