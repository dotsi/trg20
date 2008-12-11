class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, :through  => :cart_items
    
  def add(product_id) 
    items = cart_items.find_all_by_product_id(product_id) 
    product = Product.find(product_id) 

    if items.size < 1 
      ci = cart_items.create(:product_id => product_id, 
                             :quantity => 1, 
                             :price => product.price) 
    else 
      ci = items.first 
      ci.update_attribute(:quantity, ci.quantity + 1) 
    end 
    ci 
  end 
  
  def remove(product_id) 
    ci = cart_items.find_by_product_id(product_id) 

    if ci.quantity > 1 
      ci.update_attribute(:quantity, ci.quantity - 1) 
    else 
      CartItem.destroy(ci.id) 
    end 
      return ci 
  end 
  
  def total
    cart_items.inject(0) {|sum, n| n.price * n.quantity + sum}
  end
  
end
