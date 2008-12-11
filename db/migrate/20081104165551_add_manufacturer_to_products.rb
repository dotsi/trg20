class AddManufacturerToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :manufacturer_id, :integer
  end

  def self.down
    remove_column :products, :manufacturer_id
  end
end
