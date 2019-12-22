FactoryBot.define do
  factory :congrestion_info do
    sequence(:name) { |n| "やや#{n}混み" }
  end
end
