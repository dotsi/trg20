class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  belongs_to :manufacturer
  
  has_many :cart_items
  has_many :carts, :through  => :cart_items
  
  attr_accessor :category_ids
  after_save :update_categories

  # Support for images
  has_attached_file :image, :path => ":rails_root/public/images/:class/:attachment_:id_:style_:basename.:extension", :styles => { :thumb => "200x200>" }
  has_attached_file :pdf, :path => ":rails_root/public/pdf/:class_:attachment_:id_:style_:basename.:extension", :styles => { :thumbnail => ["200x200!", :jpg] } 

  #after_save callback to handle category_ids
  def update_categories
    unless category_ids.nil?
      self.categorizations.each do |c|
        c.destroy unless category_ids.include?(c.category_id.to_s)
        category_ids.delete(c.category_id.to_s)
      end 
      category_ids.each do |g|
        self.categorizations.create(:category_id => g) unless g.blank?
      end
      reload
      self.category_ids = nil
    end
  end

end
