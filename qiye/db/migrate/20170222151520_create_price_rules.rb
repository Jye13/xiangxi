class CreatePriceRules < ActiveRecord::Migration[5.0]
  def change
    create_table :price_rules do |t|
      t.integer :grade
      t.references :city, foreign_key: true
      t.references :category, foreign_key: true
      t.date :from_date

      t.timestamps
    end
  end
end
