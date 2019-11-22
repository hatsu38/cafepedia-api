FactoryBot.define do
  factory :comment do
    sequence(:name) { |n| "名無しさん#{n}" }
    sequence(:content) { |n| "広くて空いてます#{n}" }
    shop
  end
end
