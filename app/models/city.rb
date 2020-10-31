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
  has_many :stations, dependent: :nullify
  belongs_to_active_hash :prefecture

  validates :code, uniqueness: true
  validates :name, presence: true

  delegate :name_e, to: :prefecture, prefix: true

  scope :have_socket_and_wifi_shops, -> {
    eager_load(:shops).where(shops: { wifi: true, socket: true})
  }

  def self.popular(limit: 20)
    joins(:shops).where(shops: { wifi: true, socket: true}).group(:id).order('COUNT(shops.id) DESC').preload(:shops).limit(limit)
  end

  def self.search_name_by_keyword(keyword = nil)
    search_word = keyword.present? && !%w[市 区 町 村].include?(keyword) ? "%#{keyword}%" : ''
    where(['name LIKE ?', search_word])
  end

  def same_prefecutre_other_cities(limit: 50)
    prefecture.cities.have_socket_and_wifi_shops.where.not(id: self).limit(limit)
  end
end
