class AddFactoryIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :factory
  end
end
