FactoryBot.define do
  factory :shop do
    sequence(:name) { |n| "カフェ#{n}店" }
    sequence(:prefecture) { |n| "#{n}県" }
    sequence(:city) { |n| "#{n}区" }
    sequence(:other_address) { |n| "#{n}丁目#{n+1}番地" }
    sequence(:access) { |n| "徒歩#{n}分" }
    sequence(:lat) { |n| "#{n}" }
    sequence(:lng) { |n| "#{n}" }
    sequence(:is_open) { true }
    main_shop
  end
end
