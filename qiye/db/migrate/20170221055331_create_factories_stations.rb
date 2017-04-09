class CreateFactoriesStations < ActiveRecord::Migration[5.0]
  def change
    create_table :factories_stations do |t|
      t.references :factory
      t.references :station
    end
  end
end
