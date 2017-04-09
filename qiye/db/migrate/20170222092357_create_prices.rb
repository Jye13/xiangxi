class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.float :price1, default: 0
      t.float :price2, default: 0
      t.float :price3, default: 0
      t.float :price4, default: 0
      t.float :price5, default: 0
      t.float :price6, default: 0
      
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
