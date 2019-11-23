# frozen_string_literal: true

class MainShop < ApplicationRecord
  has_many :shops, dependent: :destroy
  with_options presence: true do
    validates :name
    validates :eng_name
    validates :image
  end
end
