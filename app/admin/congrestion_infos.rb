ActiveAdmin.register CongrestionInfo do
  permit_params :name

  index do
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end
end
