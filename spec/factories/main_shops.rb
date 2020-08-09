# == Schema Information
#
# Table name: main_shops
#
#  id         :bigint           not null, primary key
#  eng_name   :string           not null
#  image      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :main_shop do
    sequence(:name) { |n| "カフェ#{n}_ja店" }
    sequence(:eng_name) { |n| "カフェ#{n}_eng" }
    sequence(:image) { |n| "#{n}.png" }
  end

  trait :with_many_shops do
    after(:build) do |main_shop|
      shops = create_list(:shop, MainShop::OVER_HAVE_SHOPS)
      main_shop.shops << shops
    end
  end
end
