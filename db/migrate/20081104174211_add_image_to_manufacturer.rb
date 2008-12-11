class AddImageToManufacturer < ActiveRecord::Migration
    def self.up
      add_column :manufacturers, :image_file_name, :string
      add_column :manufacturers, :image_content_type, :string
      add_column :manufacturers, :image_file_size, :integer
	  remove_column :manufacturers, :image
    end

    def self.down
      remove_column :manufacturers, :image_file_name
      remove_column :manufacturers, :image_content_type
      remove_column :manufacturers, :image_file_size
    end
end
