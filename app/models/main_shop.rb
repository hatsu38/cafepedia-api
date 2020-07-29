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
  has_many :shops, dependent: :destroy
  with_options presence: true do
    validates :name
    validates :eng_name
    validates :image
  end
end
