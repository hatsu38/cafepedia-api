class RenameCityColumnToShops < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :city, :city_name
  end
end
