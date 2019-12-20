class CongrestionInfo < ApplicationRecord
  has_many :shop_congrestion_infos, dependent: :destroy
  has_many :shops, through: :shop_congrestion_infos
end
