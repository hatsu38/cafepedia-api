class AddLogoToMainShop < ActiveRecord::Migration[6.0]
  def change
    add_column :main_shops, :logo, :string, null: :false, default: '', after: :image, comment: "ロゴ画像"
  end
end
