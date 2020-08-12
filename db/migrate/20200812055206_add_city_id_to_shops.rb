class AddCityIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_reference :shops, :city, foreign_key: true, index: true
  end
end
