# frozen_string_literal: true

# == Schema Information
#
# Table name: main_shops
#
#  id             :bigint           not null, primary key
#  eng_name       :string           not null
#  image          :string           not null
#  logo(ロゴ画像) :string           default("")
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class MainShop < ApplicationRecord
  mount_uploader :logo, ImageUploader
  extend OrderAsSpecified

  OVER_HAVE_SHOPS = 80
  has_many :shops, dependent: :destroy
  with_options presence: true do
    validates :name
    validates :eng_name
    validates :image
  end

  validates :name, uniqueness: true
  validates :eng_name, uniqueness: true
  validates :image, uniqueness: true

  def self.popular(limit: 20)
    left_joins(:shops).group(:id).order('COUNT(shops.id) DESC').preload(:shops).limit(limit)
  end
end
