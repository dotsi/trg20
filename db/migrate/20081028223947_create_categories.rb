class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :parent_id
	    t.string :image
	    t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
