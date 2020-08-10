# == Schema Information
#
# Table name: near_station_relationships
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  main_station_id :integer          not null
#  near_station_id :integer          not null
#
# Indexes
#
#  index_main_station_and_near_station                  (main_station_id,near_station_id) UNIQUE
#  index_near_station_relationships_on_main_station_id  (main_station_id)
#  index_near_station_relationships_on_near_station_id  (near_station_id)
#
class NearStationRelationship < ApplicationRecord
  belongs_to :main_station, class_name: "Station"
  belongs_to :near_station, class_name: "Station"

  validates :main_station_id, presence: true
  validates :near_station_id, presence: true
end
