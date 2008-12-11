class Manufacturer < ActiveRecord::Base
  has_many :products
  has_attached_file :image, :styles => { :thumb => "200x200>",  :small => "200x100>" }
end
