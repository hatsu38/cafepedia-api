# == Schema Information
#
# Table name: congrestion_infos
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CongrestionInfo < ApplicationRecord
  has_many :shop_congrestion_infos, dependent: :destroy
  has_many :shops, through: :shop_congrestion_infos

  validates :name, presence: true
end
