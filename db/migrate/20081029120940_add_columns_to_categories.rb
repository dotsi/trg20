class AddColumnsToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :name, :string
    add_column :categories, :hidden, :boolean
    add_column :categories, :children_count, :integer
    add_column :categories, :ancestors_count, :integer
    add_column :categories, :descendants_count, :integer
  end

  def self.down
    remove_column :categories, :descendants_count
    remove_column :categories, :ancestors_count
    remove_column :categories, :children_count
    remove_column :categories, :hidden
    remove_column :categories, :name
  end
end
