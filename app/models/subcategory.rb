class Subcategory < ActiveRecord::Base
  attr_accessible :category_id, :name, :subcategory_id
  has_many :products
  belongs_to :category
end
