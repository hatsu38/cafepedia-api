class RenamePrefectureColumnToShops < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :prefecture, :prefecture_name
  end
end
