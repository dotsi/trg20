class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.integer :user_id
	  t.integer :product_id
	  t.integer :quantity
	  t.decimal :final_price, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
