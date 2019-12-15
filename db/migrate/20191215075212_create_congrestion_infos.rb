class CreateCongrestionInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :congrestion_infos do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
