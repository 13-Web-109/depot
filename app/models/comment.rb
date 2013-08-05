class Comment < ActiveRecord::Base
  belongs_to :product
  attr_accessible :product_id, :review, :score, :title

  validates :title, :review, presence: true   
end
