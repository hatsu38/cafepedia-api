# frozen_string_literal: true

class MainShop < ApplicationRecord
  has_many :shops, dependent: :destroy
  validates :name, presence: true
end
