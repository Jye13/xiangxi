class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :logo
      t.boolean :is_del, default: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
