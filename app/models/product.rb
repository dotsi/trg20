class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  attr_accessor :category_ids
  after_save :update_categories

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
