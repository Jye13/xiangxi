class CreateWaybills < ActiveRecord::Migration[5.0]
  def change
    create_table :waybills do |t|
      t.integer :status, default: 0
      t.string :sender_type
      t.integer :sender_id
      t.string :receiver_type
      t.integer :receiver_id
      t.references :waybill
      t.datetime :exp_time
      t.datetime :actual_time
      t.references :order, foreign_key: true

      t.timestamps
    end

    add_index :waybills, [:sender_type, :sender_id]
    add_index :waybills, [:receiver_type, :receiver_id]
  end
end
