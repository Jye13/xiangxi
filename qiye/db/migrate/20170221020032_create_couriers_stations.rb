class CreateCouriersStations < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers_stations do |t|
      t.references :courier
      t.references :station
    end
  end
end
