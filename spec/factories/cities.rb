# == Schema Information
#
# Table name: cities
#
#  id            :bigint           not null, primary key
#  code          :string           not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          default(0), not null
#
# Indexes
#
#  index_cities_on_code  (code) UNIQUE
#

FactoryBot.define do
  factory :city do
    sequence(:id) { |n| n }
    sequence(:code) { |n| "#{n}#{n + 1}#{n + 2}#{n + 3}" }
    sequence(:name) { |n| "#{n}区" }
    prefecture { Prefecture.find_by(name_e: 'tokyo') }
  end

  preload do
    factory(:test_city) { create(:city) }
  end
end

