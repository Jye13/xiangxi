class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :comment
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
