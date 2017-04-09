class AddCurrentWaybillIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :waybill
  end
end
