# == Schema Information
#
# Table name: stations
#
#  id            :bigint           not null, primary key
#  kana_name     :string           not null
#  kanji_name    :string           not null
#  created_at    :datetime         default(Wed, 23 Sep 2020 11:19:02 JST +09:00), not null
#  updated_at    :datetime         default(Wed, 23 Sep 2020 11:19:02 JST +09:00), not null
#  city_id       :bigint
#  prefecture_id :integer          default(48), not null
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
    prefecture_id { Prefecture.find_by(name_e: "tokyo").id }
  end
end
