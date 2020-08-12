# == Schema Information
#
# Table name: cities
#
#  id            :bigint           not null, primary key
#  city_code     :string           not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          default(0), not null
#
# Indexes
#
#  index_cities_on_city_code  (city_code) UNIQUE
#
class City < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :city_code, uniqueness: true
  validates :name, presence: true

end
