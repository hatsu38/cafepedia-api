# == Schema Information
#
# Table name: congrestion_infos
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :congrestion_info do
    sequence(:name) { |n| "やや#{n}混み" }
  end
end
