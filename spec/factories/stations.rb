# == Schema Information
#
# Table name: stations
#
#  id         :bigint           not null, primary key
#  kana_name  :string           not null
#  kanji_name :string           not null
#
FactoryBot.define do
  factory :station do
    sequence(:kana_name) { |n| "kana_#{n}えき" }
    sequence(:kanji_name) { |n| "kanji _#{n}駅" }
  end
end
