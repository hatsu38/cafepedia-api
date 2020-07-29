# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  content     :string           not null
#  is_complete :boolean          default(FALSE)
#  name        :string           default("名無しさん"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shop_id     :bigint
#
# Indexes
#
#  index_comments_on_shop_id  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
FactoryBot.define do
  factory :comment do
    sequence(:name) { |n| "名無しさん#{n}" }
    sequence(:content) { |n| "広くて空いてます#{n}" }
    shop
  end
end
