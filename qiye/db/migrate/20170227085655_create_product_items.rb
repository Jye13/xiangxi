class CreateProductItems < ActiveRecord::Migration[5.0]
  def change
    create_table :product_items do |t|
      t.string :serial
      t.integer :status, default: 0
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
