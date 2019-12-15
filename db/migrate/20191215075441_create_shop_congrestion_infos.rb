class CreateShopCongrestionInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_congrestion_infos do |t|
      t.references :shop, foreign_key: true
      t.references :congrestion_info, foreign_key: true

      t.timestamps
    end
  end
end
