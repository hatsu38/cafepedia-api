class Prefecture < ActiveYaml::Base
  include ActiveHash::Associations
  set_root_path 'config/divisions'
  set_filename 'prefecture'

  has_many :shops, dependent: :destroy
  has_many :cities, dependent: :destroy
  has_many :stations, dependent: :destroy

  def self.popular(limit: 10)
    popular_prefecture_ids = Shop.group(:prefecture_id).count.sort_by{ |_, v| -v }[0, limit].map(&:first)
    Prefecture.where(id: popular_prefecture_ids)
  end
end

