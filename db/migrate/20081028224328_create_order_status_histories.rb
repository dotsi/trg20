class CreateOrderStatusHistories < ActiveRecord::Migration
  def self.up
    create_table :order_status_histories do |t|
      t.integer :order_id
	  t.string :status
	  t.integer :notified
      t.timestamps
    end
  end

  def self.down
    drop_table :order_status_histories
  end
end
