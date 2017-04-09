class CreateCitiesWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_workers do |t|
      t.references :city
      t.references :worker
    end
  end
end
