class AddPrefectureIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :prefecture_id, :integer, null: false, default: 0
  end
end
