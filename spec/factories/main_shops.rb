FactoryBot.define do
  factory :main_shop do
    sequence(:name) { |n| "カフェ#{n}_ja店" }
    sequence(:eng_name) { |n| "カフェ#{n}_eng" }
    sequence(:image) { |n| "#{n}.png" }
  end
end
