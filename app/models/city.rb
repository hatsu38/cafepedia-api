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
class City < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :shops, dependent: :nullify
  belongs_to_active_hash :prefecture

  validates :code, uniqueness: true
  validates :name, presence: true
end
