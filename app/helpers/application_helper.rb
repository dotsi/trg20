# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def add_product_link(text, product) 
      link_to_remote text, {:url => {:controller => "cart", 
                :action => "add", :id => product}}, 
                {:title => "Add to Cart", 
                 :href => url_for( :controller => "cart", 
                            :action => "add", :id => product)} 
    end 

    def remove_product_link(text, product) 
      link_to_remote text, {:url => {:controller => "cart", 
                         :action => "remove", :id => product}}, 
                         {:title => "Remove product", 
                           :href => url_for( :controller => "cart", 
                                       :action => "remove", :id => product)} 
    end 

    def clear_cart_link(text = "Izprazni Košarico") 
      link_to_remote text, 
              {:url => { :controller => "cart", 
                        :action => "clear" }}, 
              {:href => url_for(:controller => "cart", 
                                :action => "clear")} 
    end 
  
  
end
