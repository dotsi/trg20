class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :trough  => :cart_items
end
