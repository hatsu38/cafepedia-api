# == Schema Information
#
# Table name: shops
#
#  id              :bigint           not null, primary key
#  access          :text
#  business_hour   :text
#  chair           :string
#  city_name       :string           not null
#  hp              :string
#  iccard          :boolean          default(FALSE)
#  is_open         :boolean          default(TRUE), not null
#  lat             :decimal(10, 7)   not null
#  lng             :decimal(11, 7)   not null
#  name            :string           not null
#  other_address   :string           not null
#  prefecture_name :string           not null
#  smoking         :boolean          default(FALSE)
#  socket          :boolean          default(FALSE)
#  tel             :string
#  wifi            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint
#  main_shop_id    :bigint
#  prefecture_id   :integer          default(0), not null
#
# Indexes
#
#  index_shops_on_city_id       (city_id)
#  index_shops_on_main_shop_id  (main_shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (main_shop_id => main_shops.id)
#
FactoryBot.define do
  factory :shop do
    association :main_shop
    association :city
    sequence(:name) { |n| "カフェ#{n}店" }
    sequence(:prefecture_name) { |n| "#{n}県" }
    sequence(:city_name) { |n| "#{n}区" }
    sequence(:other_address) { |n| "#{n}丁目#{n + 1}番地" }
    sequence(:access) { |n| "徒歩#{n}分" }
    sequence(:lat) { |n| n.to_s }
    sequence(:lng) { |n| n.to_s }
    sequence(:is_open) { true }
    sequence(:socket) { true }
    sequence(:wifi) { true }
    prefecture { Prefecture.find_by(name_e: 'tokyo') }
  end

  preload do
    factory(:test_shop) { create(:shop) }
  end
end
