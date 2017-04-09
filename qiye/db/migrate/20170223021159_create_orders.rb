class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.float :total_price
      t.integer :status, default: 0
      t.integer :courier_status, default: 0
      t.integer :voucher_status, default: 0
      t.integer :cleaning_status, default: 0

      t.timestamps
    end
  end
end
