# == Schema Information
#
# Table name: stations
#
#  id              :bigint           not null, primary key
#  kana_name       :string           not null
#  kanji_name      :string           not null
#  latitude(緯度)  :decimal(10, 7)   default(0.0), not null
#  longitude(経度) :decimal(9, 7)    default(0.0), not null
#  created_at      :datetime         default(Wed, 26 Aug 2020 14:30:52 JST +09:00), not null
#  updated_at      :datetime         default(Wed, 26 Aug 2020 14:30:52 JST +09:00), not null
#  city_id         :bigint
#  prefecture_id   :integer          default(48), not null
#
# Indexes
#
#  index_stations_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
FactoryBot.define do
  factory :station do
    association :city
    sequence(:kana_name) { |n| "kana_#{n}えき" }
    sequence(:kanji_name) { |n| "kanji _#{n}駅" }
    prefecture { Prefecture.all.sample }
  end
end
