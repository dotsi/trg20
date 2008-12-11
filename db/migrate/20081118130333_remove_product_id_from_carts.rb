class RemoveProductIdFromCarts < ActiveRecord::Migration
  def self.up
    change_table :carts do |t|
      t.remove  :product_id, :quantity
    end
  end

  def self.down
    change_table  :carts do |t|
      t.integer :product_id
      t.integer :quantity
    end
  end
end
