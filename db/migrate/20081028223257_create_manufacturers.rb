class CreateManufacturers < ActiveRecord::Migration
  def self.up
    create_table :manufacturers do |t|
      t.string :name
	  t.string :image
	  t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :manufacturers
  end
end
