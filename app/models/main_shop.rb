# frozen_string_literal: true

# == Schema Information
#
# Table name: main_shops
#
#  id         :bigint           not null, primary key
#  eng_name   :string           not null
#  image      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MainShop < ApplicationRecord
  extend OrderAsSpecified

  OVER_HAVE_SHOPS = 80
  has_many :shops, dependent: :destroy
  with_options presence: true do
    validates :name
    validates :eng_name
    validates :image
  end

  def self.popular
    over_have_shop_ids = Shop.group(:main_shop_id)
                             .having("count(*) > #{OVER_HAVE_SHOPS}")
                             .order('count_all desc')
                             .count
                             .keys
    where(id: over_have_shop_ids).order_as_specified(id: over_have_shop_ids)
  end
end
