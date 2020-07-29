# == Schema Information
#
# Table name: shop_congrestion_infos
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  congrestion_info_id :bigint
#  shop_id             :bigint
#
# Indexes
#
#  index_shop_congrestion_infos_on_congrestion_info_id  (congrestion_info_id)
#  index_shop_congrestion_infos_on_shop_id              (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (congrestion_info_id => congrestion_infos.id)
#  fk_rails_...  (shop_id => shops.id)
#
FactoryBot.define do
  factory :shop_congrestion_info do
    shop
    congrestion_info
  end
end
