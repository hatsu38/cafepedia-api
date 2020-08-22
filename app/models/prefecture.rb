class Prefecture < ActiveYaml::Base
  include ActiveHash::Associations
  set_root_path 'config/divisions'
  set_filename 'prefecture'

  has_many :shops, dependent: :destroy
  has_many :cities, dependent: :destroy
end
