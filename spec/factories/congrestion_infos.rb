FactoryBot.define do
  factroy :congrestion_info do
    sequence(:name) { |n| "やや#{n}混み" }
  end
end
