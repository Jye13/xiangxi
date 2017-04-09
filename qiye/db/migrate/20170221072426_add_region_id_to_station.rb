class AddRegionIdToStation < ActiveRecord::Migration[5.0]
  def change
    add_reference :stations, :region
  end
end
