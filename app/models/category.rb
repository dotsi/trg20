class Category < ActiveRecord::Base
  acts_as_category
  has_many :categorizations
  has_many :products, :through => :categorizations  
end
