class CreateOrderedProducts < ActiveRecord::Migration
  def self.up
    create_table :ordered_products do |t|
      t.integer :order_id
	  t.integer :product_id
	  t.string :name
	  t.integer :quantity
	  t.decimal :price, :precision => 8, :scale => 2, :default => 0
	  t.decimal :tax, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :ordered_products
  end
end
