FactoryBot.define do
  factory :station do
    sequence(:kana_name) { |n| "kana_#{n}えき" }
    sequence(:kanji_name) { |n| "kanji _#{n}駅" }
  end
end
